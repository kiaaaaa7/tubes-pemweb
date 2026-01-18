const container = document.querySelector('.container');
const registerBtn = document.querySelector('.register-btn');
const loginBtn = document.querySelector('.login-btn');

registerBtn.addEventListener('click', () => {
    container.classList.add('active');
});

loginBtn.addEventListener('click', () => {
    container.classList.remove('active');
});

window.onload = () => {
    const container = document.querySelector('.container');
    container.classList.add('active');
};

function delayedRedirect(URL) {
    setTimeout(function() {
        window.location.href = URL;
    }, 2000);
}
