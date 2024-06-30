<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<style>
.container {
    width:100%;
    background-color: #fff;
    padding: 20px;
    
}

form {
    display: grid;
    gap: 4px;
}

form label {
    font-weight: bold;
}

form input[type="text"], form input[type="number"], form textarea, form input[type="file"] {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

form textarea {
    resize: vertical;
}

.submitlink {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 1px 2px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 4px;
    text-align:center;
}

.submitlink:hover {
    background-color: #0056b3;
}

span{
	color : green;
}
</style>
</head>
<body>
<div class="container">
    <form method="POST" enctype="multipart/form-data">
    	<span id="warning"></span><br>
        <label for="movieName">Location Name:</label>
        <input type="text" id="location_Name" name="locationName" placeholder="Enter Location Name" required>
        <a href="#" class="submitlink" onclick="submitlink()">Add Location</a>
    </form>
</div>
</body>
<script>
function submitlink(){
	document.form.action = "addLocation.com";
	document.form.submit();
}
</script>

<c:if test="${saveFlag eq true}">
<script>
	function userNotFoundValidate(){
		document.getElementById("warning").innerHTML = "Saved Successfully";
		document.getElementById("location_Name").value = "";
	}
	//userNotFoundValidate();
</script>
</c:if>
</html>
