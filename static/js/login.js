document.getElementById('login-button').addEventListener('click', function () {
    window.location.href = 'index.html';
});

document.getElementById('google-account-btn').addEventListener('click', function () {
    window.location.href = '/history';
});

document.addEventListener('DOMContentLoaded', function () {
    const usernameInput = document.getElementById('username');
    const passwordInput = document.getElementById('password');

    // Function to add typing class to input field
    function addTypingClass(inputElement) {
        inputElement.classList.add('typing');
    }

    // Function to remove typing class from input field
    function removeTypingClass(inputElement) {
        inputElement.classList.remove('typing');
    }

    // Event listener for input event on username input field
    usernameInput.addEventListener('input', () => {
        addTypingClass(usernameInput);
    });

    // Event listener for input event on password input field
    passwordInput.addEventListener('input', () => {
        addTypingClass(passwordInput);
    });

    // Event listener for blur event (when input field loses focus) on username input field
    usernameInput.addEventListener('blur', () => {
        removeTypingClass(usernameInput);
    });

    // Event listener for blur event (when input field loses focus) on password input field
    passwordInput.addEventListener('blur', () => {
        removeTypingClass(passwordInput);
    });
});