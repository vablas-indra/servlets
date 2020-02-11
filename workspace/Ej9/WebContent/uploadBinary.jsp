<%@ page import="java.io.* " %>
<%@ page import="java.net.* " %>
<%@ page import="java.util.* " %>

<html>
<body bgcolor="white">
<h1> Binary file upload</h1>
<pre>

<%
  /******************************************************

  PAGINA QUE CARGA UN FICHERO BINARIO


  ******************************************************/

  final String SERVERDIR = "D:/";

  out.println("<p> INPUT START"); 
  try 
  {

    javax.servlet.ServletInputStream br=request.getInputStream();

     //br es el objeto que se encarga de leer el nombre y el contenido
     // del fichero binario
     //br es de tipo ServletInputStream i no del tipo BufferedReader
     //para poder leer en binario.

    java.io.BufferedOutputStream fileBody=null;

     //fileBody representa el fichero de salida. 

    String fileName="";
    String controlLine="";
    String temp="";
    int i;
    boolean fi;

    temp=leerLinea(br);

    while (! temp.startsWith("------") )
    {
	temp=leerLinea(br);
    }
    controlLine=new String(temp.substring(0,temp.length()-1));

    temp=leerLinea(br);
  
    
    fi=false;

    while (!fi)
    {

      if (temp.startsWith
             ("Content-Disposition: form-data; name=\"file_name\"") )
      {// File name

         while ( temp.length()>1) temp=leerLinea(br);

         temp=leerLinea(br);
    
         fileName=new String (temp.substring(0,temp.length()));
         fileBody=new  BufferedOutputStream(new 
             FileOutputStream(SERVERDIR+fileName));
       }
  
       ///LECTURA CUERPO FITXER  

       if (temp.startsWith
              ("Content-Disposition: form-data; name=\"file_body\";") )
       {// File body
         while (!(temp.equals("")) ){ 
             temp=leerLinea(br);
         }
         //LA PROX LECTURA ES EL INICIO DEL CUERPO
         int len;
         byte[] tempb=new byte[1000];
         byte[] pend=new byte[4];
         boolean pending;

         len=leerLineaBS(br, tempb);
         temp=new String(tempb,0,len); 
         pending=false;

         while (temp.indexOf(controlLine)==-1 )
         {
  
           if (pending){
	      pending=false;
              fileBody.write(pend,0,2);
	   }
	   if (temp.endsWith("\n") && temp.length()>=2) {
	      pending=true; 
	      fileBody.write(tempb,0,len-2);
	      pend[0]=tempb[len-2];
	      pend[1]=tempb[len-1];
	   }
	   else {fileBody.write(tempb,0,len);}

           len=leerLineaBS(br, tempb);
          temp=new String(tempb,0,len); 
         }

        fi=true;
       }

     if (! fi) temp=leerLinea(br);
    }

    fileBody.close();
    br.close();
    out.println("INPUT end.");

    out.println("<br>File "+fileName+" successfully uploaded<br>"); 

  }
  catch (IOException io_e) { }
%>

<%!
  //INICIO DECLARACIÓN

  /******************************************************

  public String leerLinea(javax.servlet.ServletInputStream br);

  Lee la siguiente línea del lector br (hasta encontrar '\n'). 
  Devuelve la línea leída como string. 

  ******************************************************/


  public String leerLinea(javax.servlet.ServletInputStream br){ 


  byte[] aux=new byte[2000];
  int i;
  String t="";

  try{

    i=br.readLine(aux,0,150);

    i=i-2;

    //i es el número de caracteres de la línea leídos, se debe restar dos para excluir el <CR> y <LF>  

    t=new String(aux,0,i); 

  }
  catch (IOException io_e) { }
  return t;

 }  


 int leerLineaBS(ServletInputStream br, byte [] aux){ 
  
  int i=0;

  try{
    i=br.readLine(aux,0,150);
  }
  catch (IOException io_e) { }
  return i;
 }

 //FIN DECLARACIÓN


%>


</pre>
</body>
</html>

