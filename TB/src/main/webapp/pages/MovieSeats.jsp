<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
   <!DOCTYPE html>
<html lang="en">
<head>
<style>
	.tdBorder{
		border :1px solid lightgray;
		padding : 4px 240px;
		border-radius : 4px 4px 50px 50px;
		background-color: lightgray;
	}
	.tdBorderNull{
		padding : 30px 280px;
		border-radius : 4px 4px 50px 50px;
	}
	.seat {
        appearance: none;
        -webkit-appearance: none;
        width: 35px;
        height: 35px;
        background-color: #ddd;
        border: 1px solid black;
        border-radius: 10px 10px 30px 30px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
    }
	.seat:checked {
        background-color: Green;
    }
	.container1{
		 text-align: center;
	}
	table.center {
            margin-left: auto;
            margin-right: auto;
        }
</style>
</head>
<body><div class="container1">
	<table class="center">
		<tr>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
		</tr>	
		<tr>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
		</tr>	
		<tr>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
		</tr>	
		<tr>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
		</tr>	
		<tr>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td>&nbsp;</td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
			<td class="tdSeatBorder"><input type="checkbox" id="boxCount" class="seat"></td>
		</tr>	
	</table>
	<table class="center">
		<tr><td class="tdBorderNull">&nbsp;</td></tr>
	</table>
	<table class="center">
		<tr><td class="tdBorder">&nbsp;</td></tr>
	</table>
</div>
</body>
<script>
function calculateRate(){
	document.getElementById("boxCount");
}
</script>
</html>
