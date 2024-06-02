import pandas as pd

def check_missing_data(csv_file_path):
    # Read CSV file into a DataFrame
    df = pd.read_csv(csv_file_path)

    # Initialize a new DataFrame to store highlighting information
    styled_df = df.copy()
    
    first_row_processed = False
    
    # Counters for error types
    missing_count = 0
    duplicate_count = 0
    not_valid_count = 0
    
    # Find duplicate values in 'Room/ExamVenue' column
    duplicate_rooms = styled_df['Room/ExamVenue'][styled_df['Room/ExamVenue'].duplicated(keep=False)]
    
    # Find duplicate values in 'Proctor/Staff' column
    duplicate_proctors = styled_df['Proctor/Staff'][styled_df['Proctor/Staff'].duplicated(keep=False)]
    
    # Create a new column that concatenates 'Courses', 'Year', and 'Set'
    styled_df['Course_Year_Set'] = styled_df['Courses'] + '-' + styled_df['Year'].astype(str) + '-' + styled_df['Set'].astype(str)
    
    # Find duplicate combinations of 'Courses', 'Year', and 'Set'
    duplicate_courses_year_set = styled_df['Course_Year_Set'][styled_df['Course_Year_Set'].duplicated(keep=False)]
    
    # Iterate over rows to check for missing values and highlight them
    for index, row in df.iterrows():
        # Check Room/Exam Venue and Size columns
        if pd.isna(row['Room/ExamVenue']) and not pd.isna(row['Size']):
            styled_df.at[index, 'Room/ExamVenue'] = '<span style="color: red;">' + 'Missing' + '</span>'
            missing_count += 1
        elif not pd.isna(row['Room/ExamVenue']) and pd.isna(row['Size']):
            styled_df.at[index, 'Size'] = '<span style="color: red;">' + 'Missing' + '</span>'
            missing_count += 1
            
        # Highlight cells with duplicate values in 'Room/ExamVenue' column
        if row['Room/ExamVenue'] in duplicate_rooms.values:
            styled_df.at[index, 'Room/ExamVenue'] = '<span style="color: red;">' + styled_df.at[index, 'Room/ExamVenue'] + '</span>'
            duplicate_count += 1
        
        # Highlight duplicate combinations of 'Courses', 'Year', and 'Set'
        if styled_df.at[index, 'Course_Year_Set'] in duplicate_courses_year_set.values:
            styled_df.at[index, 'Courses'] = '<span style="color: red;">' + str(styled_df.at[index, 'Courses']) + '</span>'
            styled_df.at[index, 'Year'] = '<span style="color: red;">' + str(styled_df.at[index, 'Year']) + '</span>'
            styled_df.at[index, 'Set'] = '<span style="color: red;">' + str(styled_df.at[index, 'Set']) + '</span>'
            duplicate_count += 3  # Counting each of the three columns as duplicates
        
        # Highlight duplicate values in 'Proctor/Staff' column
        if row['Proctor/Staff'] in duplicate_proctors.values:
            styled_df.at[index, 'Proctor/Staff'] = '<span style="color: red;">' + str(styled_df.at[index, 'Proctor/Staff']) + '</span>'
            duplicate_count += 1
        
        # Check Courses, Year, Set, and NumberOfStudents columns
        missing_in_group = sum(pd.isna(row[col]) for col in ['Courses', 'Year', 'Set', 'NumberOfStudents'])
        if missing_in_group >= 1 and missing_in_group <= 3:
            # If 1, 2, or 3 out of 4 specified columns have missing values, mark them as 'Missing'
            for col in ['Courses', 'Year', 'Set', 'NumberOfStudents']:
                if pd.isna(row[col]):
                    styled_df.at[index, col] = '<span style="color: red;">' + 'Missing' + '</span>'
                    missing_count += 1
        elif missing_in_group == 4:
            # If all 4 specified columns have missing values, leave them blank
            for col in ['Courses', 'Year', 'Set', 'NumberOfStudents']:
                styled_df.at[index, col] = ''
        
        # Only first row should have value
        if not first_row_processed:
            # Check TimeFrame column
            if pd.isna(row['TimeFrame']):
                styled_df.at[index, 'TimeFrame'] = '<span style="color: red;">' + 'Missing' + '</span>'
                missing_count += 1
            
            # Check StartDate and EndDate columns
            if pd.isna(row['StartDate']) and not pd.isna(row['EndDate']):
                styled_df.at[index, 'StartDate'] = '<span style="color: red;">' + 'Missing' + '</span>'
                missing_count += 1
            elif not pd.isna(row['StartDate']) and pd.isna(row['EndDate']):
                styled_df.at[index, 'EndDate'] = '<span style="color: red;">' + 'Missing' + '</span>'
                missing_count += 1
                
            first_row_processed = True
        else:
            if not pd.isna(row['TimeFrame']):
                styled_df.at[index, 'TimeFrame'] = '<span style="color: red;">' + 'not valid' + '</span>'
                not_valid_count += 1
            if not pd.isna(row['StartDate']):
                styled_df.at[index, 'StartDate'] = '<span style="color: red;">' + 'not valid' + '</span>'
                not_valid_count += 1
            if not pd.isna(row['EndDate']):
                styled_df.at[index, 'EndDate'] = '<span style="color: red;">' + 'not valid' + '</span>'
                not_valid_count += 1
    
    # Replace remaining NaN values with blank
    styled_df = styled_df.fillna(' ')
    
    # Drop the temporary 'Course_Year_Set' column before converting to HTML
    styled_df = styled_df.drop(columns=['Course_Year_Set'])
    
    # Convert the DataFrame to HTML with editable cells
    styled_html = styled_df.to_html(escape=False, index=False, table_id="editableTable", classes="table table-striped table-hover table-bordered")

    # Calculate the total number of errors
    total_errors = missing_count + duplicate_count + not_valid_count

    # Create the summary HTML
    summary_html = f"""
    <div class = "details">
        <p>Number of Missing values: {missing_count}</p>
        <p>Number of Duplicated values: {duplicate_count}</p>
        <p>Number of Not Valid values: {not_valid_count}</p>
        <p>Number of Errors: {total_errors}</p>
    </div>
    """
    
    # Combine the table and the summary
    full_html = f"""
    {summary_html}
    <div id="tableContainer">
        <div class="table-con">
            {styled_html}
        </div>
    </div>
    """

    # Write the full HTML content to a file
    with open('templates/checkMissingData.html', 'w') as file:
        file.write(full_html)
        
    return total_errors, full_html