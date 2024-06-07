document.addEventListener('DOMContentLoaded', function () {
    const buttons = document.querySelectorAll('.holder');
    const contentContainers = document.querySelectorAll('.admin-content > div');

    // Initially display the dashboard content container
    const dashboardBtn = document.getElementById('adminDashboardBtnId');
    const adminDashboard = document.getElementById('adminDashboardId');
    dashboardBtn.classList.add('holder-selected');
    adminDashboard.style.display = 'block';

    buttons.forEach(button => {
        button.addEventListener('click', function () {
            // Remove 'holder-selected' class from all buttons
            buttons.forEach(btn => btn.classList.remove('holder-selected'));
            // Add 'holder-selected' class to the clicked button
            button.classList.add('holder-selected');

            // Hide all content containers
            contentContainers.forEach(container => {
                container.style.display = 'none';
            });

            // Show the corresponding content container based on the button's ID
            const contentId = button.id.replace('BtnId', 'Id');
            const contentContainer = document.getElementById(contentId);
            if (contentContainer) {
                contentContainer.style.display = 'block';
            }
        });
    });
});
