<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
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
</style>
</head>
<body>
<div class="container">
    <form method="POST" enctype="multipart/form-data">
        <label for="movieName">Theatre Name:</label>
        <input type="text" id="theatre_Name" name="theatreName" placeholder="Enter Theatre Name" required>
        <label for="movieName">Location:</label>
       	<select name="locationName" required>
       	<option>Select One</option>
       	<c:forEach var="location" items="${locList}">
             <option value="<c:out value="${location}"/>"><c:out value="${location}"/></option>
         </c:forEach>
        </select>

        <a href="#" class="submitlink" onclick="addTheatre()">Add Theatre</a>
    </form>
</div>
</body>
<script>
	function addTheatre() {
		document.form.action = "addTheatre.com";
		document.form.submit();
	}
</script>
</html>
