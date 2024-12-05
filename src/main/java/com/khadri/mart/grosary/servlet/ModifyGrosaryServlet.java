package com.khadri.mart.grosary.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khadri.mart.grosary.form.GrosaryForm;
import com.khadri.mart.grosary.dao.GrosaryDao;

public class ModifyGrosaryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private GrosaryDao dao;
	PrintWriter pw;

	@Override
	public void init() {
		ServletContext context = getServletContext();
		dao = new GrosaryDao(context);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Entered into ModifyGrosaryServlet doPost(-,-)");
		String name = req.getParameter("name");
		String qty = req.getParameter("quantity");
		String price = req.getParameter("price");
		if (qty != null && !qty.isEmpty()) {
			try {
				Integer.parseInt(qty);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				System.out.println("Invalid price format.");
			}
		} else {
			System.out.println("productprice parameter is missing or empty.");
		}
		if (price != null && !price.isEmpty()) {
			try {
				Double.parseDouble(price);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				System.out.println("Invalid price format.");
			}
		} else {
			System.out.println("productprice parameter is missing or empty.");
		}
		GrosaryForm form = new GrosaryForm(name, Integer.parseInt(qty), Double.parseDouble(price));

		int result = dao.updateGrosary(form);
		PrintWriter pw = resp.getWriter();
		if (result > 0) {
			pw.println(result + " Grosary updated successfully");
		} else {
			pw.println("####### Something went wrong #######");
		}
	}
}
