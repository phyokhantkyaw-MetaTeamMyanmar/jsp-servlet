package com.jdc.shop.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.jdc.shop.model.SaleModel;

@WebListener
public class SaleLoader implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		var model = SaleModel.model();
		sce.getServletContext().setAttribute("sale-model", model);
	}
}
