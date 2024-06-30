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
    <form method="POST" enctype="multipart/form-data"><span id="warning"></span><br>
        <label for="movieName">Movie Name:</label>
        <input type="text" id="movieName" name="movieName" value="<c:out value="${movie}"/>" placeholder="Enter Movie Name" required>

        <label for="description">Location:</label>
        <select name="locationName" required onchange="changeLeftView('M')">
       	<option>Select One</option>
       	<c:forEach var="location" items="${locList}">
             <option value="<c:out value="${location}"/>" <c:if test="${loc eq location}">selected</c:if> ><c:out value="${location}"/></option>
         </c:forEach>
        </select>

		<label for="releaseDate">Theatre:</label>
       	<select name ="theatreName" required>
        	<option>Select One</option>
        	<c:forEach var="theatre" items="${thetreList}">
             <option value="<c:out value="${theatre}"/>"><c:out value="${theatre}"/></option>
         </c:forEach>
        </select>
        <label for="duration">Duration (minutes):</label>
        <input type="number" id="duration" name="duration" min="1" value="<c:out value="${dur}"/>" placeholder="Enter Duration" required>
        <a href="#" class="submitlink" onclick="addMovie()">Add Movie</a>
    </form>
</div>
</body>
<script>
function addMovie(){
	document.form.action = "addMovie.com";
	document.form.submit();
}
</script>

<c:if test="${saved eq true}">
<script>
	function userNotFoundValidate(){
		document.getElementById("warning").innerHTML = "Movie Saved";
		document.getElementById("movieName").value = "";
		document.getElementById("duration").value = "";
	}
	userNotFoundValidate();
</script>
</c:if>
</html>
