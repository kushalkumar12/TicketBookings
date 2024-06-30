function signUp() {
	document.form.action = "signUp.com";
	document.form.submit();
}

function login() {
	 let phone = document.getElementById('login__phone').value;
	 let password = document.getElementById('login__password').value;
	 if((null == phone || "" == phone)){
		document.getElementById("warning").innerHTML = "Please enter phone";
	 }else if(phone.length < 10){
		document.getElementById("warning").innerHTML = "Please enter 10 digit phone number";
	 }else if(phone.length > 10){
		document.getElementById("warning").innerHTML = "Phone number exceeded 10 digits";
	 }else if(null == password || "" == password){
		document.getElementById("warning").innerHTML = "Please enter password";
	 }else{
		document.form.action = "loginToUser.com";
		document.form.submit();
	 }	
}

function resetPass() {
	document.form.action = "forgetPass.o";
	document.form.submit();
}

function backToLogin() {
	document.form.action = "checkEntry.com";
	document.form.submit();
}

function passwordChecker(passwordId, confirmPasswordId) {
    let password = document.getElementById(passwordId);
    let confirmPassword = document.getElementById(confirmPasswordId);
    
    if (confirmPassword.value === password.value) {
        password.previousElementSibling.querySelector('svg').classList.replace('indicatorRed', 'indicatorGreen');
        confirmPassword.previousElementSibling.querySelector('svg').classList.replace('indicatorRed', 'indicatorGreen');
    } else {
        password.previousElementSibling.querySelector('svg').classList.replace('indicatorGreen', 'indicatorRed');
        confirmPassword.previousElementSibling.querySelector('svg').classList.replace('indicatorGreen', 'indicatorRed');
    }
}

function removeSpace(id){
	 let finalValue = document.getElementById(id).value.replace(/\s+/g, '');
	 document.getElementById(id).value = finalValue;
}