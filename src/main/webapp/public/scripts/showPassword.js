
// On document ready, add event listener to all password fields to show/hide password
//
// To use, add the script to your HTML document.
// Then, add a identifier to the password field's [data-show-password] attribute.
// Then, add a show/hide password button with the same identifier to the [data-show-password] attribute 
// The button shall use the Bootstrap icon library (https://icons.getbootstrap.com/)'s eye and eye-slash icons (filled)
document.addEventListener("DOMContentLoaded", function(event) {
    const passwordFields = {};
    const showPasswordButtons = {};

    document
        .querySelectorAll("input[type='password'][data-show-password]")
        .forEach(e => passwordFields[e.getAttribute('data-show-password')] = e );
    
    document
        .querySelectorAll("button[data-show-password]")
        .forEach(e => showPasswordButtons[e.getAttribute('data-show-password')] = e );

    Object.keys(passwordFields).forEach(key => {
        showPasswordButtons[key].addEventListener('click', () => {
            if (!passwordFields[key]) return console.error('No corresponding password field found for key: ' + key);
            
            if (passwordFields[key].type === 'password') {
                passwordFields[key].type = 'text';
                showPasswordButtons[key].innerHTML = '<i class="bi bi-eye-slash-fill"></i>';
            } else {
                passwordFields[key].type = 'password';
                showPasswordButtons[key].innerHTML = '<i class="bi bi-eye-fill"></i>';
            }
        });
    });
});