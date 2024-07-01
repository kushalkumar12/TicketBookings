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
        </tr>
        <tr>
            <td>1</td>
            <td><a class="showId"href="#">56222</a></td>
            <td>Pulp Fiction</td>
            <td>H2 Mall</td>
            <td>Hyderabad</td>
            <td>Booked</td>
            <td>7/2/2024 13:23</td>
        </tr>
        <tr>
            <td>2</td>
            <td><a class="showId" href="#">56322</a></td>
            <td>Cars</td>
            <td>H2 Mall</td>
            <td>Hyderabad</td>
            <td>Booked</td>
            <td>6/2/2024 18:23</td>
        </tr>
    </table>
</div>
</body>
</html>
