<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Your Show Home</title>
<script src="JavaScript/HomeJs.js"></script>
<style type="text/css">
/* Reset and basic styles */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f0f0f0;
}

header, footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 1rem;
    display: flex;
    justify-content: space-between; /* Added to align items at the ends */
    align-items: center; /* Added to vertically center items */
}

.profile {
    display: flex;
    align-items: center;
}

.profile img {
    width: 40px; /* Adjust size as needed */
    height: 40px;
    border-radius: 50%; /* Rounded profile image */
    margin-right: 10px; /* Space between image and name */
}

.profile .username {
    font-weight: bold;
}

.profile .logout {
    margin-left: 20px; /* Space between name and logout link */
    text-decoration: none;
    color: #fff;
    font-size: 1rem;
}

.main {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    padding: 2rem;
}

section {
    background-color: #fff;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
    border-radius: 0.5rem;
    padding: 1.5rem;
    margin-bottom: 2rem;
    flex-basis: 45%;
}

h2 {
    font-size: 1.5rem;
    margin-bottom: 1rem;
}

.movie-list {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}

.movie-card {
    width: calc(33.33% - 1rem);
    background-color: #f9f9f9;
    padding: 1rem;
    border-radius: 0.25rem;
    box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.1);
}

.movie-card h3 {
    font-size: 1.2rem;
    margin-bottom: 0.5rem;
}

.movie-card p {
    font-size: 0.9rem;
    color: #666;
}

form {
    display: grid;
    gap: 1rem;
}

label {
    font-weight: bold;
}

input[type="date"],
input[type="time"],
input[type="number"],
select {
    width: 100%;
    padding: 0.5rem;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 0.25rem;
}

button {
    background-color: #333;
    color: #fff;
    border: none;
    padding: 0.75rem 1.5rem;
    font-size: 1rem;
    cursor: pointer;
    border-radius: 0.25rem;
}

button:hover {
    background-color: #555;
}

footer {
    text-align: center;
    padding: 1rem;
    background-color: #333;
    color: #fff;
    position: fixed;
    bottom: 0;
    width: 100%;
}
.dp{
	background-color : gray;
	padding : 12px 10px;
	border-radius : 50px;
	color: Pink;
}
.titleHead{
	color : #fff;
	text-align: center;
	background-color: #333;
	border-radius:10px;
}
a{
	text-decoration: none;
}
.logOut{
	color : white;
}
span{
	color :green;
}
</style>
</head>
<body>
<form method="POST" class="form login" name="form">
    <header>
        <h1>Book Your Show</h1>
        <h5><c:out value="${fName}"/>, 
        	<c:out value="${sName}"/>&nbsp;
        	<span class="dp"><c:out value="${DP}"/></span></h5>
    </header>
    <main class="main">
        <section class="movies">
            <h2 class="titleHead">Now Showing</h2>
            <table>
            	<tr><td><h2>1. <a href="#" onclick="changeLeftView('L')">Add Location</a></h2></td></tr>
            	<tr><td><h2>2. <a href="#" onclick="changeLeftView('T')">Add Theatre</a></h2></td></tr>
            	<tr><td><h2>3. <a href="#" onclick="changeLeftView('M')">Add Movie</a></h2></td></tr>
            	<tr><td><h2>4. <a href="#" onclick="openTemplate()">Template</a></h2></td></tr>
            </table>
            <input type="hidden" id="changeMapper" name="viewValue">
        </section>
        <section class="booking">
           <c:choose>
           		<c:when test="${changeView eq 'L'}"><h2 class="titleHead">Add Location</h2></c:when>
           		<c:when test="${changeView eq 'T'}"><h2 class="titleHead">Add Theatre</h2></c:when>
           		<c:when test="${changeView eq 'M'}"><h2 class="titleHead">Add Movie</h2></c:when>
           		<c:otherwise>Click any option from the left Now Showing menu<br><span id="warning"></span><br></c:otherwise>
           	</c:choose>
           
           <div class="movie-list">
           	<c:choose>
           		<c:when test="${changeView eq 'L'}"><jsp:include page="AddLocation.jsp" /></c:when>
           		<c:when test="${changeView eq 'T'}"><jsp:include page="AddTheatre.jsp" /></c:when>
           		<c:when test="${changeView eq 'M'}"><jsp:include page="AddMovie.jsp" /></c:when>
           	</c:choose>          
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Book Your Show Dashboard</p><a href="#" class="logOut" onclick="logout()">Logout</a>
    </footer>
    </form>
</body>
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
