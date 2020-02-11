
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.util.*;

public class TranscribePeticion extends HttpServlet {

    private static final String PAGE_TOP =
            "<html>" +
            "<head" +
            "<title> Transcripción de una petición HTTP</title>" +
            "</head>" +
            "<body bgcolor=\"white\">" +
            "<h1> Contents of an http request </h1>" +
            "<pre>";
    private static final String PAGE_BOTTOM =
            "*****FINAL PETICIÓN HTTP" +
            " </pre>" +
            " </body>" +
            " </html>";

    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request,
            HttpServletResponse response) {

        String controlLine = new String("");
        Enumeration en;
        String st = new String("");


        try {


            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println(PAGE_TOP);
            out.println("<b>1. Request line </b> <br><br>");

            out.println("Method: " + request.getMethod());

            out.println("Request URL: " + request.getRequestURL());

            out.println("Query string: " + request.getQueryString());


            out.println("<p><b>2. Request header</b> <br><br>");

            en = request.getHeaderNames();

            while (en.hasMoreElements()) {

                st = (String) en.nextElement();

                out.println(st + " : " + request.getHeader(st));


            }

            out.println("<p><b>3. Request body:</b> <br><br>");
            java.io.BufferedReader br = request.getReader();

            String temp = br.readLine();

            while (temp != null) {
                out.println(temp);
                temp = br.readLine();
            }

            br.close();

            out.println(PAGE_BOTTOM);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
