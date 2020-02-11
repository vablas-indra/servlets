<%@ page import="java.io.* " %>
<%@ page import="java.net.* " %>
<%@ page import="java.util.* " %>

<html>
<body bgcolor="white">
<h1> Char file upload </h1>
<pre>

<%

/******************************************************

JSP page that uploads a local char file into the server.

THis file is located in a hardcoded server directory 

******************************************************/

final String SERVERDIR ="D:/";

try 
{

out.println("INPUT START");


//br reads name and contents of a char file

java.io.BufferedReader br=request.getReader();

//change this instruction to select another server directory

java.io.BufferedWriter fileBody= null;

String fileName="";
String controlLine="";

  String temp=br.readLine();

  while (! temp.startsWith("------") )
   {
	temp=br.readLine();
   }
  controlLine=new String(temp);

  //controlLine contains the control line

  temp=br.readLine();
  while (temp!=null)
  {

   //File name

   if (temp.startsWith("Content-Disposition: form-data; name=\"file_name\"") )
   {
       while ( !(temp.equals("")) ) temp=br.readLine();

    temp=br.readLine();
    fileName=new String (temp);
    out.println("filename="+fileName);

    fileBody=new BufferedWriter(new FileWriter(SERVERDIR+fileName));
   }
   
  //File contents
   
   if (temp.startsWith("Content-Disposition: form-data; name=\"file_body\";") )
   {
       
    while ( !(temp.equals("")) ) temp=br.readLine();
    temp=br.readLine(); 

    while (temp.indexOf(controlLine)==-1 )
    {
     out.println(temp+"<br>");

     fileBody.write(temp);
     fileBody.newLine();
     temp=br.readLine();
    }

   }
   
  temp=br.readLine();
}


fileBody.close();
br.close();
out.println("INPUT end.");

 out.println("<br>File "+fileName+" has been successfully uploaded into the server <br>"); 

  
}
catch (IOException io_e) { }


%>
</pre>
</body>
</html>

