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
public class EmployeesControllerEdit extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// create the persistence manager instance
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			System.out.print(request.getParameter("info"));
			
			Key k = KeyFactory.createKey(Employee.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
			Employee e = pm.getObjectById(Employee.class, k);
			request.setAttribute("employee", e);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Employees/edit.jsp");
			dispatcher.forward(request, response);
			try{
				if(request.getParameter("info").equals("editar")){
					String dni=request.getParameter("dni");
					String name=request.getParameter("nameu");
					String phone=request.getParameter("phone");
					String email=request.getParameter("email");
					System.out.print(request.getParameter("phone"));
					if(name == null || name.equals("")|| phone == null || phone.equals("")|| email==null||email.equals("")){System.out.print("nombre vacio");}
					else{
						if(e.getDni().equals(dni)==false){
							e.setDni(new Long(dni).longValue());
							System.out.print("email");
						}
						if(e.getName().equals(name)==false){
							e.setName(name);
							System.out.print("nombre");
						}
						if(e.getPhone().equals(phone)==false){
							e.setPhone(phone);
							System.out.print("phone");
						}
						if(e.getEmail().equals(email)==false){
							e.setEmail(email);
							System.out.print("email");
						}
					}
				}
			}catch (java.lang.NullPointerException np){}
		}catch(javax.jdo.JDOObjectNotFoundException nf) {
				response.sendRedirect("/index");
			}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}