
<%@ page import="java.io.* " %>
<%@ page import="java.net.* " %>
<%@ page import="java.util.* " %>

<html>
<body bgcolor="white">
<h1> Contents of an http request </h1>
<pre>

<%
/************************************
Este ejemplo muestra la información que recibe el servidor tras una petición HTTP

************************************/


String controlLine=new String("");
Enumeration en;
String st=new String("");

try 
{
%>

<b>1. Request line </b> <br><br>
Method:<%=request.getMethod()%> <br>
Request URL:<%=request.getRequestURL()%> <br>
Query string:<%= request.getQueryString()%><br>;

<b>2. Request header</b> <br><br>
<%
en=request.getHeaderNames();
while(en.hasMoreElements())
{
 st=(String) en.nextElement();
%>
<%=st+" : "+request.getHeader(st)%>
<%
}
%>

<b>3. Request body:</b> <br><br>
<%
java.io.BufferedReader br=request.getReader();

 String temp=br.readLine();

  while (temp!=null)
   {
      out.println(temp);
      temp=br.readLine();
   }

br.close();
out.println("END HTTP REQUEST");

}
catch (Exception io_e) {out.println("Exception:"+io_e); io_e.printStackTrace(); }


%>
</pre>
</body>
</html>

