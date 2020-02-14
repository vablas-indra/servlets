package ajaxian.book.explained.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MessageServlet extends HttpServlet {
    
    @Override
    public  void doGet(HttpServletRequest request, HttpServletResponse  response)
        throws IOException, ServletException {
          response.setContentType("text/plain");
          response.setHeader("Cache-Control", "no-cache");
          response.getWriter().write("Hello from the server");
            
    }

  }