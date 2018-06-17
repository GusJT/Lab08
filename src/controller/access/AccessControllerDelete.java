package controller.access;

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
public class AccessControllerDelete extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// create the persistence manager instance
		PersistenceManager pm = PMF.get().getPersistenceManager();
		// create the new account
		try{
		Key k = KeyFactory.createKey(Access.class.getSimpleName(), new Long(request.getParameter("accessId")).longValue());
		Access r = pm.getObjectById(Access.class, k);
		pm.deletePersistent(r);
		response.sendRedirect("/access");
		} catch(javax.jdo.JDOObjectNotFoundException nf) {
			response.sendRedirect("/access");
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}