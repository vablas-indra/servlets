<%@ page import="java.text.*" %>

<html>
<table border=1 cellpadding=3>
<tr>

<th>Euros</th>
<th>Dólares</th>
</tr>

<%
   double d;
   double e;
   NumberFormat fmt= new DecimalFormat("0.00");
   
   for (e=0.5; e<=10; e+=0.5){

     d=e*0.92;
 %>
 <tr>
 	<td align="right"><%= fmt.format(d) %></td>
   	<td align="right"><%= fmt.format(e) %></td>
  </tr>
<%
  } 
%>
</table>
</html>
