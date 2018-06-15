package controller.employees;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.*;

import controller.PMF;

import javax.servlet.*;
import javax.jdo.PersistenceManager;
import model.entity.*;
@SuppressWarnings("serial")
public class EmployeesControllerAdd extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// create the persistence manager instance
		PersistenceManager pm = PMF.get().getPersistenceManager();
		// create the new account
		request.getRequestDispatcher("WEB-INF/Views/Access/add.jsp").forward(request, response);
		String dni=request.getParameter("dni");
		String name=request.getParameter("nameu");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		System.out.print(request.getParameter("phone"));
		if(name == null || name.equals("")|| phone == null || phone.equals("")|| email==null||email.equals("")){}
		else{
			Employee a = new Employee(
				new Long(dni).longValue(),
				name,
				phone,
				email,
				true
			);
			//persist the entity
			try {
				System.out.print(request.getParameter("action"));
				pm.makePersistent(a);
			} finally {
					pm.close();
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}