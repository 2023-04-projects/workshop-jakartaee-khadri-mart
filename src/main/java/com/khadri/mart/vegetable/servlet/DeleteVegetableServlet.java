package com.khadri.mart.vegetable.servlet;

import java.io.IOException;

import com.khadri.mart.vegetable.dao.VegetableDao;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteVegetableServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private VegetableDao dao;

	@Override
	public void init() {
		ServletContext context = getServletContext();
		dao = new VegetableDao(context);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Entered into DeleteVegetableServlet doPost(-,-)");

		String vegName = req.getParameter("veg_name");
		
		System.out.println("Received 'name' parameter: " + vegName);
		
		if (vegName != null && !vegName.isEmpty()) {
			int result = dao.deleteVegetables(vegName);

			if (result > 0) {
				resp.getWriter().println("Vegetables item deleted successfully.");
			} else {
				resp.getWriter().println("Failed to delete vegetables item.");
			}
		} else {
			resp.getWriter().println("No vegetable items with this name.");
		}
	}
}


