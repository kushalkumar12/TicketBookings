
function changeLeftView(val){
	document.getElementById('changeMapper').value = val;
	document.form.action = "changeAdminView.m";
	document.form.submit();
}

function logout(){
	document.form.action = "logout.m";
	document.form.submit();
}

function openTemplate(){
	document.form.action = "navToTemplateMode.m";
	document.form.submit();
}