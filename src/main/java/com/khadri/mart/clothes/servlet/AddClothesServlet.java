package com.khadri.mart.clothes.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.khadri.mart.clothes.dao.ClothesDao;
import com.khadri.mart.clothes.form.ClothesForm;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddClothesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClothesDao dao;

	public void init() {
		ServletContext context = getServletContext();
		dao = new ClothesDao(context);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Entered into AddClothesServlet doPost(-,-)");
		String name = req.getParameter("item_name");
		String qty = req.getParameter("item_qty");
		String price = req.getParameter("item_price");
		ClothesForm form = new ClothesForm(name, Integer.parseInt(qty), Double.parseDouble(price));
		int result = dao.insertClothes(form);
		PrintWriter pw = resp.getWriter();
		if (result == 1) {
			pw.println(result + " Inserted Successfully!!!!!");
		} else {
			pw.println("@@@@@Something went wrong@@@@@");
		}
	}
}
