package com.oriontech.alsat.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.services.CategoryService;

public class CategoryListTag extends RequestContextAwareTag {
	private static final long serialVersionUID = 1L;

	@Autowired
	private CategoryService categoryService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (categoryService == null) {
			WebApplicationContext webApplicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory acbf = webApplicationContext.getAutowireCapableBeanFactory();
			acbf.autowireBean(this);
		}

		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
		try {

			List<Category> categories = categoryService.findParentCategoriesWithStatus(true);
			if (categories != null) {
				writer.write("<div class=\"left-sidebar\">");
				writer.write("<h2>Category</h2>");
				writer.write("<div class=\"panel-group category-products\" id=\"accordian\">");

				for (Category parent : categoryService.findParentCategoriesWithStatus(true)) {
					writer.write("<div class=\"panel panel-default\">");
					writer.write("<h4 class=\"category-title\">" + parent.getName() + "</h4>");
					
					if (parent.getSubCategories() != null) {						
						for (Category sub1 : parent.getSubCategories()) {							
							if (sub1.getSubCategories().size() != 0) {								
								String sub1RepName = sub1.getName().replace(" ", "");
								
								writer.write("<div class=\"panel-heading\">");								
								writer.write("<h4 class=\"panel-title\">");
								writer.write("<a data-toggle=\"collapse\" data-parent=\"#accordian\" href=\"#"
										+ sub1RepName + "\">");
								writer.write("<span class=\"badge pull-right\"><i class=\"fa fa-plus\"></i></span>"
										+ sub1.getName() + "</a></h4>");
								writer.write("</div>");																		
								writer.write("<div id=\"" + sub1RepName + "\"class=\"panel-collapse collapse\">");
								writer.write("<div class=\"panel-body\"><ul>");							
									
								for (Category sub2 : sub1.getSubCategories()) {
									writer.write("<li><a href=\"#\">" + sub2.getName() + "</a></li>");
								}
								writer.write("</ul></div></div>");
							} else {
								writer.write(
										"<div class=\"panel panel-default\"> <div class=\"panel-heading\"> <h4 class=\"panel-title\"> <a href=\"#\">"
												+ sub1.getName() + "</a></h4></div></div>");
							}

						}
					}
					writer.write("</div>");
				}
				writer.write("</div>");
				writer.write("</div>");

			}
		} catch (

		Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	

}
