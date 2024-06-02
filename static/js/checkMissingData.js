// document.addEventListener('DOMContentLoaded', function() {
    const table = document.getElementById('editableTable');
    const generateSchedBtn = document.getElementById('generateSchedBtn');

    logoutBtn.addEventListener('click', () => {
        window.location.href = '/'; 
    });

    // Navigate to history.html on "Generate Schedule" button click
    generateSchedBtn.addEventListener('click', function() {
        // const url = this.getAttribute('data-url');
        // window.location.href = url;
        showProgressCard();
                            setTimeout(() => {
                                window.location.href = '/history';
                            }, 2000); 
    });

    // Function to show progress card
    function showProgressCard() {
        overlay.style.display = 'block'; // Show the overlay
        progressCard.style.display = 'block'; //show the progresscard
        simulateProgressCard();
    }

    // Function to simulate progress
    function simulateProgressCard() {
        let progress = 0;
        const interval = setInterval(() => {
            progress += 10;
            if (progress >= 100) {
                clearInterval(interval);
            } else {
                return simulateProgressCard();
            }
        }, 500);
    }

    if (table) {
        // Make table cells editable
        table.querySelectorAll('td').forEach(cell => {
            cell.contentEditable = true;
            cell.classList.add('editable');
        });
    }

    // Add new row
    document.getElementById('addRow').addEventListener('click', function() {
        const newRow = table.insertRow();
        for (let i = 0; i < table.rows[0].cells.length; i++) {
            const newCell = newRow.insertCell();
            newCell.contentEditable = true;
            newCell.classList.add('editable');
        }
    });

    // Add new column
    document.getElementById('addColumn').addEventListener('click', function() {
        const headerRow = table.rows[0];
        const newHeaderCell = document.createElement('th');
        newHeaderCell.contentEditable = true;
        newHeaderCell.classList.add('editable');
        headerRow.appendChild(newHeaderCell);

        for (let i = 1; i < table.rows.length; i++) {
            const newCell = table.rows[i].insertCell();
            newCell.contentEditable = true;
            newCell.classList.add('editable');
        }
    });

    // // Save edited table data
    // document.getElementById('saveTable').addEventListener('click', function() {
    //     const rows = Array.from(table.rows);
    //     const data = rows.map(row => Array.from(row.cells).map(cell => cell.innerText));
    //     console.log('Table data:', data);
    //     // Here you can send `data` to the server for saving, or handle it as needed.
    // });
// });
