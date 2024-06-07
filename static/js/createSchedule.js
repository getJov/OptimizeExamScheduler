document.addEventListener('DOMContentLoaded', function () {
    const generateScheduleBtn = document.getElementById('type-generateScheduleBtn');
    const facultyLoadBtn = document.getElementById('type-facultyLoad');
    const examVenueBtn = document.getElementById('type-examVenue');

    const uploadCsvBtn = document.getElementById('uploadCsv');
    const uploadCsvContainer = document.getElementById('uploadCsv-container');
    const closeOverlayBtn = document.getElementById('closeOverlay');

    const generateScheduleContainer = document.getElementById('generateSchedule-container');
    const facultyLoadContainer = document.getElementById('facultyLoad-container');
    const examVenueContainer = document.getElementById('examVenue-container');

    function hideAllContainers() {
        generateScheduleContainer.style.display = 'none';
        facultyLoadContainer.style.display = 'none';
        examVenueContainer.style.display = 'none';
    }

    function resetButtonClasses() {
        generateScheduleBtn.classList.remove('type-btn-selected');
        generateScheduleBtn.classList.add('normalBtn');
        facultyLoadBtn.classList.remove('type-btn-selected');
        facultyLoadBtn.classList.add('normalBtn');
        examVenueBtn.classList.remove('type-btn-selected');
        examVenueBtn.classList.add('normalBtn');
    }

    generateScheduleBtn.addEventListener('click', function (event) {
        event.preventDefault();
        hideAllContainers();
        generateScheduleContainer.style.display = 'block';
        resetButtonClasses();
        generateScheduleBtn.classList.add('type-btn-selected');
        generateScheduleBtn.classList.remove('normalBtn');
    });

    facultyLoadBtn.addEventListener('click', function (event) {
        event.preventDefault();
        hideAllContainers();
        facultyLoadContainer.style.display = 'block';
        resetButtonClasses();
        facultyLoadBtn.classList.add('type-btn-selected');
        facultyLoadBtn.classList.remove('normalBtn');
    });

    examVenueBtn.addEventListener('click', function (event) {
        event.preventDefault();
        hideAllContainers();
        examVenueContainer.style.display = 'block';
        resetButtonClasses();
        examVenueBtn.classList.add('type-btn-selected');
        examVenueBtn.classList.remove('normalBtn');
    });

    // Initially hide all containers except the generate schedule container
    hideAllContainers();
    generateScheduleContainer.style.display = 'block';
    generateScheduleBtn.classList.add('type-btn-selected');
    generateScheduleBtn.classList.remove('normalBtn');

    uploadCsvBtn.addEventListener('click', function () {
        uploadCsvContainer.style.display = 'flex';
    });

    closeOverlayBtn.addEventListener('click', function () {
        uploadCsvContainer.style.display = 'none'; // Hide the overlay
    });
    
    uploadCsvContainer.addEventListener('click', function (event) {
        if (event.target === uploadCsvContainer) {
            uploadCsvContainer.style.display = 'none'; // Hide the overlay
        }
    });
});


{/* <script>
    function performSearch() {
        var query = document.getElementById("searchInput").value;
        fetch('/search', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ query: query }),
        })
            .then(response => response.json())
            .then(data => {
                var tableHead = document.getElementById("resultsTableHead");
                var tableBody = document.getElementById("resultsTableBody");

                // Clear previous results
                tableHead.innerHTML = '';
                tableBody.innerHTML = '';

                if (data.results.length > 0) {
                    // Add table headers
                    var headers = data.results[0];
                    var headerRow = document.createElement('tr');

                    // Limit headers to 7
                    headers.slice(0, 7).forEach(header => {
                        var th = document.createElement('th');
                        th.textContent = header;
                        headerRow.appendChild(th);
                    });
                    tableHead.appendChild(headerRow);

                    // Add table rows
                    data.results.slice(1).forEach(row => {
                        var tr = document.createElement('tr');

                        // Limit row cells to 7
                        row.slice(0, 7).forEach(cell => {
                            var td = document.createElement('td');
                            td.textContent = cell;
                            tr.appendChild(td);
                        });
                        tableBody.appendChild(tr);
                    });
                } else {
                    var noResultsRow = document.createElement('tr');
                    var noResultsCell = document.createElement('td');
                    noResultsCell.textContent = 'No results found';
                    noResultsCell.colSpan = 7; // Adjust to 7 to match the column limit
                    noResultsRow.appendChild(noResultsCell);
                    tableBody.appendChild(noResultsRow);
                }
            })
            .catch(error => console.error('Error:', error));
    }

    document.getElementById('viewMySche').addEventListener('click', function () {
        const tableBody = document.getElementById('tableBody');
        if (tableBody.style.display === 'none' || tableBody.style.display === '') {
            tableBody.style.display = 'table-row-group'; // Default display for tbody
        } else {
            tableBody.style.display = 'none';
        }
    });
</script> */}