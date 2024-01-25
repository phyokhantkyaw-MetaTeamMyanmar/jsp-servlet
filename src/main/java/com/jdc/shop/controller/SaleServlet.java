package com.jdc.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.shop.model.SaleModel;
import com.jdc.shop.model.ShoppingCart;
import com.jdc.shop.model.entity.Voucher;

@WebServlet({ "/sale-history", "/sale-details", "/checkout" })
public class SaleServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private SaleModel model;

	@Override
	public void init() throws ServletException {
		var application = getServletContext();
		model = (SaleModel) application.getAttribute("sale-model");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		switch (req.getServletPath()) {
		case "/sale-history":
			showSaleHistory(req, resp);
			break;
		case "/sale-details":
			showDetails(req, resp);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var customer = req.getParameter("customer");
		var cart = (ShoppingCart) req.getSession().getAttribute("cart");
		var sales = cart.items();
		var voucherId = model.create(customer, sales);
		req.getSession().removeAttribute("cart");
		resp.sendRedirect(req.getServletContext().getContextPath().concat("/sale-details?id=") + voucherId);
	}

	private void showDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var str = req.getParameter("id");
		var id = Integer.parseInt(str);
		var voucher = (Voucher) model.findById(id);
		req.setAttribute("data", voucher);
		getServletContext().getRequestDispatcher("/sale-details.jsp").forward(req, resp);

	}

	private void showSaleHistory(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Voucher> list = model.getSaleHistory();
		req.setAttribute("data", list);
		getServletContext().getRequestDispatcher("/sale-list.jsp").forward(req, resp);
	}
}
