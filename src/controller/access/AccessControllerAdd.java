package controller.access;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import controller.PMF;

import javax.servlet.*;
import javax.jdo.PersistenceManager;
import model.entity.*;
@SuppressWarnings("serial")
public class AccessControllerAdd extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		/*Role r = new Role("mesero");
		Resource re = new Resource("/comida");
		try {
			pm.makePersistent(r);
			pm.makePersistent(re);
		} finally {
				pm.close();
		}*/
		try{
			System.out.print(request.getParameter("info"));
			String query = "select from " + Role.class.getName();
			String query2 = "select from " + Resource.class.getName();
			List<Role> roles = (List<Role>)pm.newQuery(query).execute();
			List<Resource> resources = (List<Resource>)pm.newQuery(query2).execute();
			request.setAttribute("roles", roles);
			request.setAttribute("resources", resources);
			String queryp = "select " + Role.class.getName();
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/add.jsp");
			dispatcher.forward(request, response);
			try{
				if(request.getParameter("info").equals("agregar")){
					String idRole=request.getParameter("rolesl");
					String idResource=request.getParameter("resourcesl");
					if(idRole == null || idRole.equals("")|| idResource == null || idResource.equals("")){System.out.print("nombre vacio");}
					else{
						Access a = new Access(
							new Long(idRole).longValue(),
							new Long(idResource).longValue(),
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
			}catch (java.lang.NullPointerException np){}
		}catch(java.lang.NullPointerException np){} {
				System.out.print("error");
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}