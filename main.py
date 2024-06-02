from flask import Flask, request, jsonify, redirect, url_for, render_template, make_response
import pandas as pd
import csv
import io

from backend.py.checkMissingData import check_missing_data
from backend.py.generateExamSched import titleForExam

app = Flask(__name__)

@app.route('/')
def home():
    return render_template("login.html")

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

if __name__ == '__main__':
    app.run(debug=True)