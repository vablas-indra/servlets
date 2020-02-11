
<%@ page import="java.io.* " %>
<%@ page import="java.net.* " %>
<%@ page import="java.util.* " %>

<html>
<body bgcolor="white">
<h1> Carga un fichero de texto </h1>
<pre>

<%
/************************************
Este ejemplo carga un fichero de texto del cliente
al servidor y devuelve su contenido para visualizarlo en una
página web.

************************************/


String controlLine=new String("");
boolean fi;

try 
{

out.println("INPUT start:");
java.io.BufferedReader br=request.getReader();

String fileName="";
StringBuffer fileBody=new StringBuffer(1000);

 String temp=br.readLine();
  while (! temp.startsWith("------") )
   {
	temp=br.readLine();
	out.println(temp);
   }
  controlLine=new String(temp);
  
 temp=br.readLine();
 
 while (temp!=null) 
 {
 
   //1.Leemos el nombre del fichero

   if (temp.startsWith("Content-Disposition: form-data; name=\"file_name\"") )
   {
    while ( !(temp.equals("")) ) temp=br.readLine();
    
    temp=br.readLine();
    fileName=temp;
   }

   //2. Leemos el cuerpo del fichero

   if (temp.startsWith("Content-Disposition: form-data; name=\"file_body\";") )
   {
    while ( !(temp.equals("")) ) temp=br.readLine();
    
    temp=br.readLine(); 

    //Lectura del contenido de fichero

    while (temp.indexOf(controlLine)==-1 )
    {
      fileBody.append(temp);
      fileBody.append("\n");
      temp=br.readLine();	
    }
   }
  temp=br.readLine();
 }
br.close();
out.println("LECTURA FINALIZADA.....");

out.println("<br>Fichero "+fileName+" <br>Contenido:<br>"+fileBody);

}
catch (Exception io_e) {out.println("Exception:"+io_e); io_e.printStackTrace(); }


%>
</pre>
</body>
</html>

