from flask import Flask, request, jsonify, redirect, url_for, render_template, make_response, session
import pandas as pd
from backend.py.checkMissingData import check_missing_data
from flask import make_response
from flask_mysqldb import MySQL
from flask_bcrypt import Bcrypt
import mysql.connector
import csv
import io

from backend.py.checkMissingData import check_missing_data
from backend.py.generateExamSched import titleForExam

app = Flask(__name__)
app.secret_key = 'oes'
bcrypt = Bcrypt(app)

# MySQL configurations
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'oes'
}

mysql = mysql.connector.connect(**db_config)

# loginPage / Home
@app.route('/')
def home():
    if 'username' in session:
        return f"Hello, {session['username']}! You are logged in as {session['role']}."
    return redirect(url_for('login'))


# login
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cursor = mysql.cursor(dictionary=True)
        cursor.execute('SELECT * FROM User WHERE Username = %s', (username,))
        user = cursor.fetchone()

        if user and bcrypt.check_password_hash(user['PasswordHash'], password):
            session['username'] = user['Username']
            session['role'] = user['RoleID']
            if user['RoleID'] == 1:
                return redirect(url_for('superadmin'))
            elif user['RoleID'] == 2:
                return redirect(url_for('admin'))
            elif user['RoleID'] == 3:
                return redirect(url_for('faculty'))
            else:
                return redirect(url_for('home'))
        else:
            error = "Invalid credentials, please try again."
    return render_template('login.html', error=error)

# register
@app.route('/register', methods=['GET', 'POST'])
def register():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        firstName = request.form['firstName']
        lastName = request.form['lastName']
        role = request.form['role']

        hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')

        cursor = mysql.cursor()
        try:
            cursor.execute('INSERT INTO User (Username, PasswordHash, Email, firstName, lastName, RoleID, CreatedAt, UpdatedAt) VALUES (%s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)',
                           (username, hashed_password, email, firstName, lastName, role))
            mysql.commit()
        except mysql.connector.Error as err:
            error = f"Error: {err}"
        finally:
            cursor.close()

        if not error:
            return redirect(url_for('superadmin'))
    
    return render_template('superadmin.html', error=error)

@app.route('/index.html')
def index():
    return render_template("index.html")

@app.route('/process_csv', methods=['POST'])
def process_csv():
    if 'csvFile' not in request.files:
        return 'No file uploaded', 400
    
    file = request.files['csvFile']
    
    # Check if the file is a CSV
    if file.filename.endswith('.csv'):
        # Save the file temporarily
        file_path = 'temp.csv'
        file.save(file_path)
        
        # Process the CSV file to check for missing data
        total_errors, missing_data_html = check_missing_data(file_path)
        
        # Store the processed HTML in the session
        return jsonify({'total_errors': total_errors, 'missing_data_html': missing_data_html})
     
    return jsonify({'error': 'Invalid file format'}), 400

@app.route('/result')
def show_result():
    missing_data_html = request.args.get('data', '')
    return render_template('result.html', missing_data_html=missing_data_html)

@app.route('/history')
def show_history():
    exam_title = titleForExam()
    return render_template('history.html', exam_title=exam_title)

@app.route('/get-csv')
def get_csv():
    csv_path = './Final Exam2ndSemS.Y2023-2024.csv'
    output = io.StringIO()
    with open(csv_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        writer = csv.writer(output)
        
        # Combine the first row into one column and add empty columns to fill up to 7 columns
        first_row = next(reader)
        combined_row = ' '.join(first_row)
        writer.writerow([combined_row] + [''] * 6)
        
        # Write the next rows with a maximum of 7 columns
        for row in reader:
            writer.writerow(row[:7])
    
    response = make_response(output.getvalue())
    response.headers["Content-Disposition"] = "attachment; filename=data.csv"
    response.headers["Content-type"] = "text/csv"
    return response

@app.route('/search', methods=['POST'])
def search():
    query = request.json.get('query', '')
    csv_path = './Final Exam2ndSemS.Y2023-2024.csv'
    results = []

    with open(csv_path, newline='') as csvfile:
        reader = csv.reader(csvfile)
        headers = next(reader)  # Read the headers
        results.append(headers)  # Add headers to results

        for row in reader:
            if query.lower() in ','.join(row).lower():
                results.append(row)
    
    return jsonify({'results': results})

# superadmin
@app.route('/superadmin')
def superadmin():
    if 'username' in session and session['role'] == 1:
        username = session['username']
        return render_template('superadmin.html', username=username)
    else:
        return redirect(url_for('login'))

# admin
@app.route('/admin')
def admin():
    if 'username' in session and session['role'] == 2:
        username = session['username']
        return render_template('admin.html', username=username)
    else:
        return redirect(url_for('login'))

# faculty
@app.route('/faculty')
def faculty():
    if 'username' in session and session['role'] == 3:
        username = session['username']
        return render_template('faculty.html', username=username)
    else:
        return redirect(url_for('login'))

# logout
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)