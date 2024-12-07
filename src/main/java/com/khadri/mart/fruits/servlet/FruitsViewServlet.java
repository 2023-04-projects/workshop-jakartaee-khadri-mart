package com.khadri.mart.fruits.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.khadri.mart.fruits.dao.FruitsDao;
import com.khadri.mart.fruits.form.FruitsForm;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FruitsViewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private FruitsDao dao;

	public void init() {
		ServletContext context = getServletContext();
		dao = new FruitsDao(context);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("Entered into AddFruitsServlet doPost(-,-)");
		String name = req.getParameter("item_name");
		String qty = req.getParameter("item_qty");
		String price = req.getParameter("item_price");
		FruitsForm form = new FruitsForm(name, Integer.parseInt(qty), Double.parseDouble(price));
		List<FruitsForm> result = dao.selectFruits(name);
		PrintWriter pw = resp.getWriter();

	}
}
