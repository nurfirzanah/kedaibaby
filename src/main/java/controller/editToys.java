package controller;

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

import connection.ConnectionManager;

/**
 * Servlet implementation class editProductController
 */
@WebServlet("/admin/editToys")
public class editToys extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editToys() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		
        int prodid = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int qty = Integer.parseInt(request.getParameter("qty"));
        String price = request.getParameter("price");
        String desc = request.getParameter("desc");
        String size = request.getParameter("prodsize");
        Connection conn = null;
		 try {

			 	Connection con = ConnectionManager.getConnection();

	            Statement st = con.createStatement();

	            String sql = "update product set PRODNAME='"+name+"', PRODQTY='"+qty+"', PRODPRICE='"+price+"', PRODDESC='"+desc+"' where PRODID='"+prodid+"'";
	            Statement st2 = con.createStatement();
	            String sql2 = "update toys set colour='"+size+"' where PRODID='"+prodid+"'";
	            st.executeUpdate(sql);
	            st2.executeUpdate(sql2);
	            System.out.println("Data is Successfully Updated into Product Table");
	               }catch (SQLException ex) {
	                   
	                   ex.printStackTrace();
	               } finally {
	                   if (conn != null) {
	                       // closes the database connection
	                       try {
	                           conn.close();
	                       } catch (SQLException ex) {
	                           ex.printStackTrace();
	                       }
	                   }
	         }response.sendRedirect("ViewProductlist.jsp");
	    }

	}
