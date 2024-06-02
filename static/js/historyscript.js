var el = document.getElementById("wrapper");
var toggleButton = document.getElementById("menu-toggle");

toggleButton.onclick = function () {
    el.classList.toggle("toggled");
};

//print
document.addEventListener("DOMContentLoaded", function () {
    var printButton = document.querySelector('.btn-print');

    printButton.addEventListener('click', function () {
        // Select the table
        var table = document.getElementById('examTable');
        var newWin = window.open('', '', 'width=800,height=600');

        // Write the table content to the new window
        newWin.document.write('<html><head><title>Print Table</title>');
        newWin.document.write('<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">');
        newWin.document.write('</head><body>');
        newWin.document.write('<div class="container mt-5">');
        newWin.document.write(table.outerHTML);
        newWin.document.write('</div>');
        newWin.document.write('</body></html>');

        newWin.document.close();
        newWin.print();
        newWin.close();
    });
});


//dropdown content
function changeTableContent(tableId, buttonText) {
    // Hide all tables
    var tables = document.querySelectorAll('.table-responsive');
    tables.forEach(function (table) {
        table.style.display = 'none';
    });

    // Show the selected table
    var selectedTable = document.getElementById(tableId);
    if (selectedTable) {
        selectedTable.style.display = 'block';
    }

    // Update the button text
    document.getElementById('dropdownButtonText').textContent = buttonText;
}

// Show the default table (Day)
changeTableContent('day', 'Day');


document.addEventListener('DOMContentLoaded', function () {
    const profileBtn = document.getElementById('profileBtn');
    const profileInfo = document.getElementById('profile-info');
    const logoutBtn = document.getElementById('logout-btn');

    const sidebarBtn = document.getElementById('sidebar-btn');
    const sidebarHistory = document.getElementById('sidebar-history');
    const arrowRight = document.getElementById('arrow-right');
    const arrowLeft = document.getElementById('arrow-left');


    logoutBtn.addEventListener('click', () => {
        window.location.href = '/';
    });

    // Toggle profile info on button click
    profileBtn.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevent the click from propagating to the document
        profileInfo.style.display = (profileInfo.style.display === 'block') ? 'none' : 'block';
    });

    // Hide profile info when clicking outside
    // document.addEventListener('click', (event) => {
    //     if (!profileInfo.contains(event.target) && !profileBtn.contains(event.target)) {
    //         profileInfo.style.display = 'none';
    //     }
    // });

    //sidebar
    sidebarBtn.addEventListener('click', function () {
        if (sidebarHistory.style.display === 'none' || sidebarHistory.style.display === '') {
            sidebarHistory.style.display = 'flex';
            arrowRight.style.display = 'none';
            arrowLeft.style.display = 'block';
            sidebarBtn.style.width = '296px';
            sidebarBtn.style.gap = '196px';
        } else {
            sidebarHistory.style.display = 'none';
            arrowRight.style.display = 'block';
            arrowLeft.style.display = 'none';
            sidebarBtn.style.width = '';
            sidebarBtn.style.gap = '';
        }
    });
});