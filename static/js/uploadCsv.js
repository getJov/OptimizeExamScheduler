document.addEventListener('DOMContentLoaded', function () {
    const csvFileInput = document.getElementById('csvFile');
    const dropArea = document.getElementById('drop-area');
    const dropAreaText = document.getElementById('drop-area-text');
    const uploadButton = document.getElementById('uploadButton');
    const cancelButton = document.getElementById('cancelButton');
    const errorOverlay = document.getElementById('error-overlay');
    const errorText = document.querySelector('.error-text');
    const okButton = document.getElementById('ok-button');

    const generateSchedBtn = document.getElementById('generateSchedBtn');

    const overlay = document.getElementById('overlay');
    const checkmissingdata = document.getElementById('checkdata');
    const progressCard = document.getElementById('progressCard');

    const defaultDropAreaContent = dropArea.innerHTML;

    const MAX_FILE_SIZE = 20 * 1024 * 1024; // 20 MB

    // Prevent default drag behaviors
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
        dropArea.addEventListener(eventName, preventDefaults, false);
    });

    function preventDefaults(e) {
        e.preventDefault();
        e.stopPropagation();
    }

    // Highlight drop area when file is dragged over it
    ['dragenter', 'dragover'].forEach(eventName => {
        dropArea.addEventListener(eventName, () => dropArea.classList.add('drag-over'), false);
    });

    ['dragleave', 'drop'].forEach(eventName => {
        dropArea.addEventListener(eventName, () => dropArea.classList.remove('drag-over'), false);
    });

    // Add dragover event listener
dropArea.addEventListener('dragover', (event) => {
    event.preventDefault();
    dropArea.classList.add('dragover');
    dropArea.classList.remove('dragout');
});

// Add dragleave event listener
dropArea.addEventListener('dragleave', () => {
    dropArea.classList.remove('dragover');
    dropArea.classList.add('dragout');
});

// Add drop event listener
dropArea.addEventListener('drop', (event) => {
    event.preventDefault();
    dropArea.classList.remove('dragover');
    dropArea.classList.remove('dragout');
    // You can handle the file here
    const files = event.dataTransfer.files;
    console.log('Files dropped:', files);
    // Reset border color to grey after dropping the file
    dropArea.style.borderColor = '';
});

// Add dragenter event listener to change color back to grey when dragging outside the drop area
document.addEventListener('dragenter', (event) => {
    if (!dropArea.contains(event.target)) {
        dropArea.classList.add('dragout');
    }
});

// Prevent default behavior for dragover and drop events on the document level and can't download the file you dragover
document.addEventListener('dragover', (event) => {
    event.preventDefault();
});

document.addEventListener('drop', (event) => {
    event.preventDefault();
});

    // Handle file drop
    dropArea.addEventListener('drop', handleDrop, false);

    function handleDrop(e) {
        const dt = e.dataTransfer;
        const files = dt.files;

        if (files.length > 0) {
            handleFiles(files);
        }
    }

    // Handle file selection through input
    csvFileInput.addEventListener('change', (e) => {
        handleFiles(e.target.files);
    });

    function handleFiles(files) {
        const file = files[0];

        if (file && file.type === 'text/csv' && file.size <= MAX_FILE_SIZE) {
            csvFileInput.files = files; // set the files to the input element
            displayFileInDropArea(file.name);
        } else {
            showError('Invalid file. Please upload a CSV file with size up to 20 MB.');
            csvFileInput.value = '';
        }
    }

    function displayFileInDropArea(fileName) {
        dropArea.innerHTML = '';

        const dropIcon = document.createElement('img');
        dropIcon.src = './static/images/csv-icon.svg';
        dropIcon.alt = 'CSV Icon';
        dropIcon.classList.add('responsive-image');
        dropArea.appendChild(dropIcon);

        const fileNameParagraph = document.createElement('p');
        fileNameParagraph.textContent = fileName;
        fileNameParagraph.classList.add('responsive-text');
        dropArea.appendChild(fileNameParagraph);
    }

    function showError(message) {
        errorText.textContent = message;
        errorOverlay.style.display = 'flex';
    }

    okButton.addEventListener('click', () => {
        errorOverlay.style.display = 'none';
    });

    uploadButton.addEventListener('click', () => {
        if (csvFileInput.files.length === 0) {
            showError('Please select a CSV file to upload.');
        } else {
            const file = csvFileInput.files[0];
            const formData = new FormData();
            formData.append('csvFile', file);

            // Progress bar
            showProgress();

            fetch('/process_csv', {
                method: 'POST',
                body: formData,
            })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        showError('An error occurred: ' + data.error);
                        return;
                    }

                    const total_errors = data.total_errors;
                    const missing_data_html = data.missing_data_html;

                    completeProgressBar().then(() => {
                        if (total_errors > 0) {
                            window.location.href = '/result?data=' + encodeURIComponent(missing_data_html);
                        } else {
                            showProgressCard();
                            setTimeout(() => {
                                window.location.href = '/history';
                            }, 2000); 
                        }
                    });
                })
                .catch(error => {
                    console.error('Error:', error);
                    showError('An error occurred while processing the file.');
                });
        }
    });

    // Function to show progress bar
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
                // stop at 95%
                updateProgressBar(95);
            } else {
                updateProgressBar(progress);
            }
        }, 500);
    }

    function updateProgressBar(progress) {
        const progressBar = document.querySelector('.cprogress-bar');
        progressBar.style.width = progress + '%';
    }

    function completeProgressBar() {
        return new Promise(resolve => {
            // Wait for a short duration before completing the progress bar
            setTimeout(() => {
                updateProgressBar(100);
                resolve();
            }, 1000); // Adjust the delay time as needed
        });
    }

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

    cancelButton.addEventListener('click', () => {
        csvFileInput.value = '';
        dropArea.innerHTML = defaultDropAreaContent;
    });

    generateSchedBtn.addEventListener('click', () => {
        showProgressCard();
        setTimeout(() => {
            window.location.href = '/history';
        }, 2000); 
    });
});