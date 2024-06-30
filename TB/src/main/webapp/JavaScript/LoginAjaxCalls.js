function checkUser(id) {
	//let userName = document.getElementById('login__username').value;
	let userName = document.getElementById(id).value.replace(/\s+/g, '');
	document.getElementById(id).value = userName;
	let userNameid = document.getElementById(id);
	
	if(userName != null && userName != '' && userName.length > 9){
		 $.ajax({
	        url: 'checkUser.com',
	        type : 'POST',
	        data : {userName:userName},
	      	dataType: 'json',
	        success: function(jsonData) {
				let count = jsonData;
			    if (count === 0) {
			        userNameid.previousElementSibling.querySelector('svg').classList.replace('indicatorRed', 'indicatorGreen');
			    } else {
			        userNameid.previousElementSibling.querySelector('svg').classList.replace('indicatorGreen', 'indicatorRed');
			    }
	            console.log(count);
        	}
    	});	
	}else{
		userNameid.previousElementSibling.querySelector('svg').classList.replace('indicatorGreen', 'indicatorRed');
	}
}