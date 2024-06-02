const overlay = document.getElementById('overlay');
        const checkmissingdata = document.getElementById('checkdata');
        const submitBtn = document.getElementById('submitBtn');
        
 
    // Function to show progress card
    function showProgress() {
            overlay.style.display = 'block'; // Show the overlay
            checkmissingdata.style.display = 'block';
            simulateProgress();
    }

    // Function to simulate progress
    function simulateProgress() {
        let progress = 0;
        const interval = setInterval(() => {
            progress += 10;
            if (progress >= 95) {
                clearInterval(interval);
                showProgressCard();
            } else {
                updateProgressBar(progress);
            }
        }, 500);
    }

    function updateProgressBar(progress) {
        const progressBar = document.querySelector('.cprogress-bar');
        progressBar.style.width = progress + '%';
    }

    // Event listener for submit button
    submitBtn.addEventListener('click', showProgress);