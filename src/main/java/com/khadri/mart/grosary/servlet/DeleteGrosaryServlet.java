package com.khadri.mart.grosary.servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.khadri.mart.grosary.dao.GrosaryDao;
import com.khadri.mart.grosary.form.GrosaryForm;

public class DeleteGrosaryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private GrosaryDao dao;

	@Override
	public void init() {
		ServletContext context = getServletContext();
		dao = new GrosaryDao(context);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String name = req.getParameter("name");
		String qty = req.getParameter("quantity");
		String price = req.getParameter("price");
		System.out.println("Received 'name' parameter: " + name);
		
		GrosaryForm form = new GrosaryForm(name, Integer.parseInt(qty), Double.parseDouble(price));

		if (name != null && !name.isEmpty()) {
			int result = dao.deleteGrosary(name);

			if (result >0) {
				resp.getWriter().println("Grocery item deleted successfully.");
			} else {
				resp.getWriter().println("Failed to delete grocery item.");
			}
		} else {
			resp.getWriter().println("No grocery items withthis name.");
		}
	}
}
