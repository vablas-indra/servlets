<%@ page import="java.io.* " %>
<%@ page import="java.util.* " %>

<html>
<head>

</head>


<body>
<center>

<table border="1" cellpadding="3" cellspacing="1" width="600">
<tr>
<td colspan="2" align="center" class="header">
Valores de los parámetros del formulario:
</td>
</tr>
<tr><th> Nombre </th><th> Valor</th></tr>
<%



   int fileraAct=0;
   Enumeration nompars= request.getParameterNames();
   while(nompars.hasMoreElements()){
    String nom= (String) nompars.nextElement();
    String[] valors=request.getParameterValues(nom);
    for (int i=0; i<valors.length; i++) {
     String valor=valors[i];
 %>

     <tr valign= "top">
     <td align="right" ><B><%= nom%></B></td>
     <td align="left" ><%= valor%></td>
     </tr>
<%
   }
  }
  java.io.BufferedReader br=request.getReader();
  String st=br.readLine();

%>

<tr valign= "top">
<td align="right"><B>Datos</B></td>
<td align="left"><%= st %></td>
</tr>

</table>
</center>
</body>
</html>


