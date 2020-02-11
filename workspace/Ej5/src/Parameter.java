
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.util.*;

public class Parameter extends HttpServlet {

    private static final String PAGE_TOP =
            "<html>" +
            "<head>" +
            "<title> Parameter capture in an http request</title>" +
            "</head>" +
            "<body bgcolor=\"white\">" +
            "<h1> Parameter capture in an http request </h1>" +
            "<pre>";
    private static final String PAGE_BOTTOM =
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

        String[] ciudades;
        Enumeration en;
        String st = new String();


        try {


            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println(PAGE_TOP);
            out.println("<b> Capture of the parameter names: </b> <br><br>");


            en = request.getParameterNames();


            while (en.hasMoreElements()) {

                st = (String) en.nextElement();

                out.println("name=" + st);
            }

            out.println("<b>Capture of the parameter values:</b><br><br>");

            out.println("Parameter name= 'nombre'----> Value=" + request.getParameter("nombre"));

            out.println("Parameter name= 'ciudad'----> Values=");


            ciudades = request.getParameterValues("ciudad");

            for (int i = 0; i < ciudades.length; i++) {
                out.println("ciudad " + i + ": " + ciudades[i]);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
