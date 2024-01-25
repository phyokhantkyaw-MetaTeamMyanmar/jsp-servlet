package com.jdc.shop.listener;

import java.io.BufferedReader;
import java.io.FileReader;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.jdc.shop.model.ProductModel;
import com.jdc.shop.model.entity.Product;

@WebListener
public class ProductLoader implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		var model = new ProductModel();
		sce.getServletContext().setAttribute("products", model);
		String filePath = sce.getServletContext().getRealPath("/WEB-INF/product.txt");
		try (BufferedReader input = new BufferedReader(new FileReader(filePath))) {
			String line = null;
			while (null != (line = input.readLine())) {
				var array = line.split("\t");
				model.add(new Product(array[1], array[0], Integer.parseInt(array[2])));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		sce.getServletContext().setAttribute("products", model);
	}
}
