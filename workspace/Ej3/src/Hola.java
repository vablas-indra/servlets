import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.util.*;

public class Hola extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException {
            doPost( request, response ) ;
    }
    
    public void doPost (HttpServletRequest request,
HttpServletResponse response) {
    try {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("<h1> HELLO WORLD!!!! </h1>");
        out.println("</body>");
        out.println("</html>");
    } catch (Exception ex) {   ex.printStackTrace();
    }
  }
}
