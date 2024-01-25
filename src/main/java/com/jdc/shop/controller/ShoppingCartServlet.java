package com.jdc.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.shop.model.ProductModel;
import com.jdc.shop.model.ShoppingCart;
import com.jdc.shop.model.entity.Product;

@WebServlet({ "/cart-add", "/cart-show", "/cart-clear", "/cart-minus", "/cart-plus" })
public class ShoppingCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		switch (req.getServletPath()) {
		case "/cart-add":
			addToCart(req, resp);
			break;
		case "/cart-show":
			getServletContext().getRequestDispatcher("/my-cart.jsp").forward(req, resp);
			break;
		case "/cart-clear":
			clear(req, resp);
			break;
		case "/cart-plus":
		case "/cart-minus":
			changeCartItemCount(req, resp);
			break;
		}
	}

	private void changeCartItemCount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		var cart = (ShoppingCart) req.getSession().getAttribute("cart");
		var product = req.getParameter("product");
		var plus = "/cart-plus".equals(req.getServletPath());
		cart.changeItemCount(plus, Integer.parseInt(product));
		var link = req.getContextPath().concat("/my-cart.jsp");
		resp.sendRedirect(link);
	}

	private void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var session = req.getSession();
		if (null != session) {
			var cart = (ShoppingCart) session.getAttribute("cart");
			cart.clear();
		}
		getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
	}

	private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var productId = req.getParameter("product");
		var productModel = (ProductModel) getServletContext().getAttribute("products");
		Product product = productModel.findById(Integer.parseInt(productId));
		var session = req.getSession(true);
		var cart = (ShoppingCart) session.getAttribute("cart");
		if (cart == null) {
			cart = ShoppingCart.generate();
			session.setAttribute("cart", cart);
		}
		cart.add(product);
		getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);

	}
}
