package com.khadri.mart.vegetable.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.khadri.mart.vegetable.dao.VegetableDao;
import com.khadri.mart.vegetable.form.VegetableForm;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ModifyVegetableServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private VegetableDao dao;
	PrintWriter pw;

	@Override
	public void init() {
		ServletContext context = getServletContext();
		dao = new VegetableDao(context);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Entered into ModifyVegetableServlet doPost(-,-)");
		String vegName = req.getParameter("veg_name");
		String vegQty = req.getParameter("veg_qty");
		String vegPrice = req.getParameter("veg_price");
		if (vegQty != null && !vegQty.isEmpty()) {
			try {
				Integer.parseInt(vegQty);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				System.out.println("Invalid price format.");
			}
		} else {
			System.out.println("parameter is missing or empty.");
		}
		if (vegPrice != null && !vegPrice.isEmpty()) {
			try {
				Double.parseDouble(vegPrice);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				System.out.println("Invalid price format.");
			}
		} else {
			System.out.println("price parameter is missing or empty.");
		}
		VegetableForm form = new VegetableForm(vegName, Integer.parseInt(vegQty), Double.parseDouble(vegPrice));

		int result = dao.updateVegetables(form);
		PrintWriter pw = resp.getWriter();
		if (result > 0) {
			pw.println(result + " vegetable updated successfully");
		} else {
			pw.println("####### Something went wrong #######");
		}
	}
}