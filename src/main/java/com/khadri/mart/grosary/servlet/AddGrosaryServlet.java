package com.khadri.mart.grosary.servlet;


import java.io.IOException;
import java.io.PrintWriter;

import com.khadri.mart.grosary.dao.GrosaryDao;
import com.khadri.mart.grosary.form.GrosaryForm;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddGrosaryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private GrosaryDao dao;

	@Override
	public void init() {
		ServletContext context = getServletContext();
		dao = new GrosaryDao(context);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Entered into AddGrosaryServlet doPost(-,-)");
		String name = req.getParameter("name");
		String qty = req.getParameter("qty");
		String price = req.getParameter("price");

		GrosaryForm form = new GrosaryForm(name, Integer.parseInt(qty), Double.parseDouble(price));

		int result = dao.insertGrosary(form);

		PrintWriter pw = resp.getWriter();

		if (result == 1) {
			pw.println(result + " Inserted Successfully!!!!!");
		} else {
			pw.println("@@@@@Something went wrong@@@@@");
		}

	}

}
