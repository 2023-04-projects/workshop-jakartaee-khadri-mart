package com.khadri.mart.vegetable.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.khadri.mart.vegetable.dao.VegetableDao;
import com.khadri.mart.vegetable.form.VegetableForm;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddVegetableServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private VegetableDao dao;

	@Override
	public void init() throws ServletException {

		ServletContext context = getServletContext();
		dao = new VegetableDao(context);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Entered into AddVegetableServlet doPost(-,-)");
		String vegName = req.getParameter("veg_name");
		String vegQty = req.getParameter("veg_qty");
		String vegPrice = req.getParameter("veg_price");

		VegetableForm form = new VegetableForm(vegName, Integer.parseInt(vegQty), Double.parseDouble(vegPrice));
		int result = dao.insertVegetables(form);

		PrintWriter pw = resp.getWriter();

		if (result == 1) {
			pw.println(result + " Inserted Successfully!!!!!");
		} else {
			pw.println("===========Something went wrong============");
		}

	}
}
