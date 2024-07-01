<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
   <!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<style>
	.tdBorder{
		border :1px solid lightgray;
		padding : 2px 320px;
		border-radius : 10px 10px 50px 50px;
		background-color: gray;
	}
	.tdBorderNull{
		padding : 1px 320px;
		border-radius : 4px 4px 50px 50px;
	}
	.container1{
		 text-align: center;
	}
	table.center {
            margin-left: auto;
            margin-right: auto;
            align : center;
    }
    .seatingTable {
    	margin: 0 auto;
    	border-spacing: 10px;
	}

	.seat {
	    text-align: center;
	}
	
	.seat-checkbox {
	    display: none;
	}
	
	.seatLabel {
	    display: block;
	    background-color: #4CAF50;
	    color: white;
	    padding: 10px 20px;
	    border-radius: 5px;
	    cursor: pointer;
	}
	
	.seat-checkbox:checked + label {
	    background-color: #DA5DA1;
	}
	
	.seat-checkbox:disabled + label {
	    background-color: lightgray;
	    color : black;
	}
	.no-border-input {
            border: none;
            outline: none;
            text-align: center;
      }
      .center1 {
        margin: 0 auto;
        width: 50%;
        border-collapse: collapse;
    }
    
    .number-of-seats {
        text-align: left;
        font-weight: bold;
    }
    
    .ticket-rate {
        text-align: right;
         font-weight: bold;
    }
    
    .total-amount {
        text-align: center; 
        font-size: 1.2em;
        background-color: #f0f0f0;
    }
</style>
</head>
<body><div class="container1">
<table class="seats seatingTable">
<c:forEach var="seats" items="${allSeats}">
	<tr>
	<c:forEach var="seat" items="${seats}">
		<td class="seat">
			<input onchange="calculateRate()" 
					value="<c:out value="${seat}"/>" 
					type="checkbox" class="seat-checkbox" 
					id="<c:out value="${seat}"/>" 
					<c:if test="${seat eq 'A1' or seat eq 'B5'}">disabled</c:if>/>
			<label class="seatLabel" for="<c:out value="${seat}"/>"><c:out value="${seat}"/></label>
		</td>
	</c:forEach>

     </tr>
</c:forEach>
 </table>
	<table class="center">
		<tr><td class="tdBorderNull">&nbsp;</td></tr>
	</table>
	<table class="center">
		<tr><td class="tdBorder">&nbsp;</td></tr>
	</table>
	
	<table class="center1">
    <tr>
        <td class="number-of-seats">Number of seats: <span id="seatCounts"></span></td>
        <td class="ticket-rate">Ticket Rate: 140</td>
    </tr>
    <tr>
        <td colspan="2" class="total-amount">Total Amount: <span id="totalAmt"></span></td> <!-- colspan to span across two columns -->
    </tr>
    <tr>
   		<td colspan="2" class="total-amount">Seat Numbers: <span id="seatNumbers"></span></td> <!-- colspan to span across two columns -->
    </tr>
</table>

</div>
</body>
<script>
document.getElementById("seatCounts").innerHTML = 0;
document.getElementById("totalAmt").innerHTML = 0;
document.getElementById("seatNumbers").innerHTML = 0;
function calculateRate() {
    var checkboxes = document.getElementsByClassName('seat-checkbox');
    var checkedCount = 0;
    var eachSeat = 140;
    var seatNumber = '';

    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            seatNumber += ", " + checkboxes[i].value;
            checkedCount++;
        }
    }

    if (seatNumber.length > 0) {
        seatNumber = seatNumber.substring(2); 
    }

    document.getElementById("seatCounts").innerHTML = checkedCount;
    document.getElementById("totalAmt").innerHTML = checkedCount * eachSeat;
    document.getElementById("seatNumbers").innerHTML = seatNumber;
}
</script>
</html>
