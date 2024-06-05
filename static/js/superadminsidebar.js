document.getElementById('brand-link').addEventListener('click', function (event) {
    event.preventDefault(); // Prevent the default link behavior
    window.location.href = '/'; // Redirect to index.html
});

document.addEventListener('DOMContentLoaded', function () {
    const profileBtn = document.getElementById('profileBtn');
    const profileInfo = document.getElementById('profile-info');
    const logoutBtn = document.getElementById('logout-btn');
    const sidebarBtn = document.getElementById('sidebar-btn');
    const sidebarHistory = document.getElementById('sidebar-history');
    const arrowRight = document.getElementById('arrow-right');
    const arrowLeft = document.getElementById('arrow-left');


    logoutBtn.addEventListener('click', () => {
        window.location.href = "/logout";
    });

    // Toggle profile info on button click
    profileBtn.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevent the click from propagating to the document
        profileInfo.style.display = (profileInfo.style.display === 'block') ? 'none' : 'block';
    });

    //Hide profile info when clicking outside
    document.addEventListener('click', (event) => {
        if (!profileInfo.contains(event.target) && !profileBtn.contains(event.target)) {
            profileInfo.style.display = 'none';
        }
    });

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