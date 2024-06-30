
function changeLeftView(val){
	document.getElementById('changeMapper').value = val;
	document.form.action = "changeAdminView.com";
	document.form.submit();
}

function logout(){
	document.form.action = "logout.com";
	document.form.submit();
}