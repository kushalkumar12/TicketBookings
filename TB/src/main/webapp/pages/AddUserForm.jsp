<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #dcdcdc;
        }

        h2 {
            text-align: center;
            color: white;
        }

        .header-strip {
            background-color:black;
            color: white;
            text-align: center;
            padding: 1px 0px;
            margin: 2% 32.4% 0% 32.4%;
            border-radius : 20px 20px 0px 0px;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius : 0px 0px 20px 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
        }

        label {
            width: 45%;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="tel"],
        select {
            width: 48%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select {
            width: calc(48% - 2px);
        }

       .button {
            display: inline-block; /* Ensure anchor tags behave like block elements */
            width: 32%; /* Same width as before */
            background-color: maroon;
            color: white;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: black;
        }

        .mark {
            color: #d32f2f;
        }

        .error-message {
            color: #d32f2f;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
        .errorMsg {
        	margin-top:10px;
        	text-align: center;
        	color:red;
        }
    </style>
</head>
<body>
    <div class="header-strip">
        <h2>Add User</h2>
    </div>
    <form name="form" method="post">
        <label for="userFirstName">First Name:<font class="mark">*</font></label>
        <input type="text" id="userFirstName" name="userFirstName" placeholder="Enter First Name">

        <label for="userLastName">Last Name:<font class="mark">*</font></label>
        <input type="text" id="userLastName" name="userLastName" placeholder="Enter Last Name">

        <label for="userId">User ID:<font class="mark">*</font></label>
        <input type="text" id="userId" name="userId" placeholder="Enter User ID " >

        <label for="userPassword">User Password:<font class="mark">*</font></label>
        <input type="text" id="userPassword" name="userPassword" placeholder="Enter User Password">

        <label for="address">Address:<font class="mark">*</font></label>
        <input type="text" id="address" name="address" placeholder="Enter Address">

        <label for="email">Email:<font class="mark">*</font></label>
        <input type="email" id="email" name="email" placeholder="Enter Email">

        <label for="phone">Phone:<font class="mark">*</font></label>
        <input type="tel" id="phone" name="phone" placeholder="Enter Phone">

        <label for="roleName">Role Name:<font class="mark">*</font></label>
        <select id="roleName" name="roleName">
            <option value="0">Select One</option>
            <c:forEach var="role" items="${roles}">
                <option value="<c:out value="${role[0]}"/>"><c:out value="${role[1]}"/></option>
            </c:forEach>
        </select>
       
        <a href="#" class="button" onclick="addUserDetails(); return false;">Submit</a>
    	<a href="#" class="button" onclick="clearFields(); return false;">Clear</a>
    </form>
    <div class="errorMsg"><font id="addressError"></font></div>
		

    <script>
	    function validateAllFields() {
	        let userFirstName = document.getElementById("userFirstName").value;
	        let userLastName = document.getElementById("userLastName").value;
	        let userId = document.getElementById("userId").value;
	        let userPassword = document.getElementById("userPassword").value;
	        let address = document.getElementById("address").value;
	        let email = document.getElementById("email").value;
	        let phone = document.getElementById("phone").value;
	        let roleName = document.getElementById("roleName").value;
	
	        if (userFirstName === '' || userFirstName === null) {
	            document.getElementById("addressError").innerHTML = "Please fill First Name.";
	            return false;
	        } else if(userLastName === "" || userLastName === null){
    			document.getElementById("addressError").innerHTML = "Please fill Last Name.";
    			return false;
    		} else if(userId === "" || userId === null){
    			document.getElementById("addressError").innerHTML = "Please fill User Id.";
    			return false;
    		} else if(userPassword === "" || userPassword === null){
    			document.getElementById("addressError").innerHTML = "Please fill Password.";
    			return false;
    		} else if(address === "" || address === null){
    			document.getElementById("addressError").innerHTML = "Please fill Address.";
    			return false;
    		} else if(email === "" || email === null){
    			document.getElementById("addressError").innerHTML = "Please fill Email.";
    			return false;
    		} else if(phone === "" || phone === null){
    			document.getElementById("addressError").innerHTML = "Please fill Phone.";
    			return false;
    		} else if(roleName === "" || roleName === null){
    			document.getElementById("addressError").innerHTML = "Please select any one Role.";
    			return false;
    		} else {
	            return true;
	        }
	    }

    	
        function clearFields() {
            document.getElementById("userFirstName").value = "";
            document.getElementById("userLastName").value = "";
            document.getElementById("userId").value = "";
            document.getElementById("userPassword").value = "";
            document.getElementById("address").value = "";
            document.getElementById("email").value = "";
            document.getElementById("phone").value = "";
            document.getElementById("roleName").selectedIndex = 0;

            var errorElements = document.getElementsByClassName("error-message");
            for (var i = 0; i < errorElements.length; i++) {
                errorElements[i].innerHTML = "";
            }
        }
        function addUserDetails(){
        	if(validateAllFields()){
        		document.form.action = "addUserDetails.o";
            	document.form.submit();
        	}
        }
        
    </script>
</body>
</html>