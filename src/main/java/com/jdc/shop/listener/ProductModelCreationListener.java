package com.jdc.shop.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

import com.jdc.shop.model.ProductModel;

@WebListener
public class ProductModelCreationListener implements ServletContextAttributeListener {

	@Override
	public void attributeAdded(ServletContextAttributeEvent scae) {
		var value = scae.getValue();
		if (value instanceof ProductModel) {
			var name = scae.getName();
			scae.getServletContext().log(String.format("Attriute name is ", name));
			ProductModel model = (ProductModel) value;
			scae.getServletContext().log(String.format("Product Count is ", model.getList().size()));
		}
	}
}
