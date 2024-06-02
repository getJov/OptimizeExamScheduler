import csv
import random
import string

def generate_large_csv(file_path, num_rows, num_columns):
    with open(file_path, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        # Write header
        header = ['Column {}'.format(i+1) for i in range(num_columns)]
        writer.writerow(header)
        
        # Write rows
        for _ in range(num_rows):
            row = [''.join(random.choices(string.ascii_letters + string.digits, k=10)) for _ in range(num_columns)]
            writer.writerow(row)

# Specify the file path and size
file_path = 'large_file.csv'
num_rows = 800000  # 800k rows
num_columns = 10    # 10 columns

# Generate the large CSV file
generate_large_csv(file_path, num_rows, num_columns)
