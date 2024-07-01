<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

    .container1 {
        text-align: center;
    }
    table {
        width: 100%; 
        margin: 0 auto;
        border-collapse: collapse;
        background-color: #ffffff;
        border: 2px solid #3498db;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 10px 20px;
        border: 1px solid #3498db;
        text-align: center;
    }
    th {
        background-color: #ecf0f1;
        color: #3498db;
        font-size: 16px;
        font-weight: bold;
        text-transform: uppercase;
    }
    td {
        background-color: #d5dbdb;
        font-size: 14px;
    }
    tr:hover {
        background-color: #red;
    }
    .showId{
    	font-weight: bold;
    }
</style>
</head>
<body>
<div class="container1">
    <table>
        <tr>
            <th>S.NO</th>
            <th>Booking ID</th>
            <th>Movie Name</th>
            <th>Theatre Name</th>
            <th>Location</th>
            <th>Status</th>
            <th>Show Time</th>
            <th>Rate</th>
            <th># Seats</th>
        </tr>
        <c:forEach var="bookings" items="${bookinglist}" varStatus="status">
			<tr>
				<td><c:out value="${status.count}"/></td>
			 	<c:forEach var="booking" items="${bookings}"><td><c:out value="${booking}"/></td></c:forEach>
			</tr>
		</c:forEach>
        

    </table>
</div>
</body>
</html>
