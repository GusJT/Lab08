package controller.employees;

import java.io.IOException;
import javax.servlet.http.*;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import javax.servlet.*;
import javax.jdo.PersistenceManager;
import model.entity.*;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import controller.PMF;
@SuppressWarnings("serial")
public class EmployeesControllerView extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// create the persistence manager instance
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			System.out.print(request.getParameter("info"));
			Key k = KeyFactory.createKey(Employee.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
			Employee e = pm.getObjectById(Employee.class, k);
			request.setAttribute("employee", e);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Employees/view.jsp");
			dispatcher.forward(request, response);
		}catch(javax.jdo.JDOObjectNotFoundException nf) {
				response.sendRedirect("/index");
			}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}