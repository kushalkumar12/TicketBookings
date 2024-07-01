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
    padding: 10px 120px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 4px;
}

.submitlink:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
<div class="container">
    <form method="POST" enctype="multipart/form-data"><span id="warning"></span><br>
        <label for="movieName">Movie:</label>
        <select name="movieName" required onchange="enableBookings()">
       	<option value="">Select One</option>
       	<c:forEach var="movie" items="${mvList}">
             <option value="<c:out value="${movie}"/>" <c:if test="${mvName eq movie}">selected</c:if> ><c:out value="${movie}"/></option>
         </c:forEach>
        </select>

        <label for="description">Location:</label>
        <select name="locationName" required onchange="enableBookings()">
       	<option value="">Select One</option>
       	<c:forEach var="location" items="${locList}">
             <option value="<c:out value="${location}"/>" <c:if test="${locName eq location}">selected</c:if> ><c:out value="${location}"/></option>
         </c:forEach>
        </select>

		<label for="releaseDate">Theatre:</label>
       	<select name ="theatreName" required>
        	<option value="">Select One</option>
        	<c:forEach var="theatre" items="${theaList}">
             <option value="<c:out value="${theatre}"/>" <c:if test="${theName eq theatre}">selected</c:if> ><c:out value="${theatre}"/></option>
         </c:forEach>
        </select>
        <br><br>
        <input type="hidden" id="enableSeats" name="openSeats">
        <a href="#" class="submitlink" onclick="openSeats()">View Seats</a>
    </form>
</div>
</body>
<script>
function openSeats(){
	document.getElementById("enableSeats").value = "YES";
	document.form.action = "enableBooking.m";
	document.form.submit();
}

function enableBookings(){
	document.form.action = "enableBooking.m";
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
