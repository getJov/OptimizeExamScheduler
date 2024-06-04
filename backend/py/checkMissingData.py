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
    
    # Find duplicate values in 'RoomForExam' column
    duplicate_rooms = styled_df['RoomForExam'][styled_df['RoomForExam'].duplicated(keep=False)]
    
    # Create a new column that concatenates 'Section' and 'CourseCode'
    styled_df['Section_CourseCode'] = styled_df['Section'] + '-' + styled_df['CourseCode'].astype(str)
    
    # Find duplicate combinations of 'Section' and 'CourseCode'
    duplicate_section_course = styled_df['Section_CourseCode'][styled_df['Section_CourseCode'].duplicated(keep=False)]
    
    # Iterate over rows to check for missing values and highlight them
    for index, row in df.iterrows():
        # Check for unique Section and CourseCode combination
        if styled_df.at[index, 'Section_CourseCode'] in duplicate_section_course.values:
            styled_df.at[index, 'Section'] = '<span style="color: red;">' + str(styled_df.at[index, 'Section']) + '</span>'
            styled_df.at[index, 'CourseCode'] = '<span style="color: red;">' + str(styled_df.at[index, 'CourseCode']) + '</span>'
            duplicate_count += 2
        
        if all(pd.isna(row[col]) for col in ['Section', 'CourseCode', 'ClassSize', 'Instructor']):
            for col in ['Section', 'CourseCode', 'ClassSize', 'Instructor']:
                styled_df.at[index, col] = ''
        else:
            for col in ['Section', 'CourseCode', 'ClassSize', 'Instructor']:
                if pd.isna(row[col]):
                    styled_df.at[index, col] = '<span style="color: red;">' + 'Missing' + '</span>'
                    missing_count += 1

        # Check RoomForExam and RoomSize columns
        if pd.isna(row['RoomForExam']) and not pd.isna(row['RoomSize']):
            styled_df.at[index, 'RoomForExam'] = '<span style="color: red;">' + 'Missing' + '</span>'
            missing_count += 1
        elif not pd.isna(row['RoomForExam']) and pd.isna(row['RoomSize']):
            styled_df.at[index, 'RoomSize'] = '<span style="color: red;">' + 'Missing' + '</span>'
            missing_count += 1
        # elif pd.isna(row['RoomForExam']) and pd.isna(row['RoomSize']):
        #     styled_df.at[index, 'RoomForExam'] = '<span style="color: red;">' + 'Missing' + '</span>'
        #     styled_df.at[index, 'RoomSize'] = '<span style="color: red;">' + 'Missing' + '</span>'
        #     missing_count += 2

        # Highlight cells with duplicate values in 'RoomForExam' column
        if row['RoomForExam'] in duplicate_rooms.values:
            styled_df.at[index, 'RoomForExam'] = '<span style="color: red;">' + styled_df.at[index, 'RoomForExam'] + '</span>'
            duplicate_count += 1

        # Only the first row should have value in StartDate and EndDate
        if not first_row_processed:
            # Check StartDate and EndDate columns
            if pd.isna(row['StartDate']) and not pd.isna(row['EndDate']):
                styled_df.at[index, 'StartDate'] = '<span style="color: red;">' + 'Missing' + '</span>'
                missing_count += 1
            elif not pd.isna(row['StartDate']) and pd.isna(row['EndDate']):
                styled_df.at[index, 'EndDate'] = '<span style="color: red;">' + 'Missing' + '</span>'
                missing_count += 1

            first_row_processed = True
        else:
            if not pd.isna(row['StartDate']):
                styled_df.at[index, 'StartDate'] = '<span style="color: red;">' + 'not valid' + '</span>'
                not_valid_count += 1
            if not pd.isna(row['EndDate']):
                styled_df.at[index, 'EndDate'] = '<span style="color: red;">' + 'not valid' + '</span>'
                not_valid_count += 1

        # Check date constraints for StartDate and EndDate
        if not pd.isna(row['StartDate']) and not pd.isna(row['EndDate']):
            start_date = pd.to_datetime(row['StartDate'])
            end_date = pd.to_datetime(row['EndDate'])
            if end_date <= start_date:
                styled_df.at[index, 'EndDate'] = '<span style="color: red;">' + 'not allowed' + '</span>'
                not_valid_count += 1
            elif (end_date - start_date).days < 4:
                styled_df.at[index, 'EndDate'] = '<span style="color: red;">' + 'not allowed' + '</span>'
                not_valid_count += 1
    
    # Replace remaining NaN values with blank
    styled_df = styled_df.fillna(' ')
    
    # Drop the temporary 'Section_CourseCode' column before converting to HTML
    styled_df = styled_df.drop(columns=['Section_CourseCode'])
    
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
