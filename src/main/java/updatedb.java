

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updatedb
 */
@WebServlet("/UpdateProfileUserController")
public class updatedb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatedb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);       
        PrintWriter out = response.getWriter();
        int userid = Integer.parseInt(request.getParameter("userid"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int phonenum = Integer.parseInt(request.getParameter("phonenum"));
        String address = request.getParameter("address");
        String pass = request.getParameter("pass");

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","babyshop","system");

            Statement st = conn.createStatement();

            String sql = "update customer set USERNAME='"+name+"',USEREMAIL ='"+email+"', USERNUM='"+phonenum+"', USERADDRESS='"+address+"',USERPASS='"+pass+"' where USERID='"+userid+"'";

            st.executeUpdate(sql);
            out.println("Data is Successfully Updated into Customer Table");
               }catch (ClassNotFoundException e) {

              e.printStackTrace();

        } catch (SQLException e) {

              e.printStackTrace();

         }response.sendRedirect("viewProfile.jsp");
    }

}