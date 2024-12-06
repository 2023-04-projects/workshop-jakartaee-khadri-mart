package com.khadri.mart.clothes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.khadri.mart.clothes.dao.ClothesDao;
import com.khadri.mart.clothes.form.ClothesForm;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ModifyClothesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClothesDao dao;
	@Override
	public void init() {
		ServletContext context = getServletContext();
		dao = new ClothesDao(context);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Entered into ModifyClothesServlet doPost(-,-)");
		String name = req.getParameter("item_name");
		String qty = req.getParameter("item_qty");
		String price = req.getParameter("item_price");

		if (qty != null && !qty.isEmpty()) {
			try {
				Integer.parseInt(qty);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				System.out.println("Invalid price format.");
			}
		} else {
			System.out.println("parameter is missing or empty.");
		}
		if (price != null && !price.isEmpty()) {
			try {
				Double.parseDouble(price);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				System.out.println("Invalid price format.");
			}
		} else {
			System.out.println(" parameter is missing or empty.");
		}
		ClothesForm form = new ClothesForm(name, Integer.parseInt(qty), Double.parseDouble(price));
		int result = dao.updateClothes(form);
		PrintWriter pw = resp.getWriter();
		if (result > 0) {
			pw.println(result + " Clothes updated successfully");
		} else {
			pw.println("####### Something went wrong #######");
		}
	}
}
