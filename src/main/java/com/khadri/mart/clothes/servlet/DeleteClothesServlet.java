package com.khadri.mart.clothes.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khadri.mart.clothes.dao.ClothesDao;

public class DeleteClothesServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ClothesDao dao;
	@Override
	public void init() {
		ServletContext context = getServletContext();
		dao = new ClothesDao(context);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String name = req.getParameter("item_name");
		System.out.println("Received 'name' parameter: " + name);

		if (name != null && !name.isEmpty()) {
			int result = dao.deleteClothes(name);

			if (result > 0) {
				resp.getWriter().println("Clothes item deleted successfully.");
			} else {
				resp.getWriter().println("Failed to delete Clothes item.");
			}
		} else {
			resp.getWriter().println("No Clothes items withthis name.");
		}
	}
}
