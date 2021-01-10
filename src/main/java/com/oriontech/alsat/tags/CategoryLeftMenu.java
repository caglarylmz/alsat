package com.oriontech.alsat.tags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.models.Tip;
import com.oriontech.alsat.services.AdvertService;
import com.oriontech.alsat.services.CategoryService;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CategoryLeftMenu extends RequestContextAwareTag {
	private static final long serialVersionUID = 1L;

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdvertService advertService;

	private Category category;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (advertService == null) {
			WebApplicationContext webApplicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory acbf = webApplicationContext.getAutowireCapableBeanFactory();
			acbf.autowireBean(this);
		}
		if (categoryService == null) {
			WebApplicationContext webApplicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory acbf = webApplicationContext.getAutowireCapableBeanFactory();
			acbf.autowireBean(this);
		}
		if (category == null) {
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
			if (category.getParentCategory() == null) {
				writer.write("<ul class='ana_menu scroll'>");
				writer.write("<li><a href='" + getRequestContext().getContextPath() + "/kategori/" + category.getId()
						+ "'>" + category.getName() + "</a><span class='toplam'>("
						+ advertService.getAllAdvertsByCategoryAndChildCategories(category.getId()).size()
						+ ")</span>");
				writer.write("<ul>");
				for (Category cat : category.getSubCategories()) {
					writer.write("<li>");
					writer.write("<a href=' " + getRequestContext().getContextPath() + "/kategori/" + cat.getId() + "'>"
							+ cat.getName() + "</a><span class='toplam'>("
							+ advertService.getAllAdvertsByCategoryAndChildCategories(cat.getId()).size() + ")</span>");
					writer.write("</li>");
				}
				writer.write("</ul>");
				writer.write("</li>");
				writer.write("</ul>");
			}
			if (category.getParentCategory() != null) {
				writer.write("<ul class='ana_menu scroll'>");
				writer.write("<li><a href='" + getRequestContext().getContextPath() + "/kategori/"
						+ category.getParentCategory().getId() + "'>" + category.getParentCategory().getName()
						+ "</a><span class='toplam'>(" + advertService
								.getAllAdvertsByCategoryAndChildCategories(category.getParentCategory().getId()).size()
						+ ")</span>");
				writer.write("<ul>");
				writer.write("<li><a href='" + getRequestContext().getContextPath() + "/kategori/" + category.getId()
						+ "'>" + category.getName() + "</a><span class='toplam'>("
						+ advertService.getAllAdvertsByCategoryAndChildCategories(category.getId()).size()
						+ ")</span>");
				if (!category.getSubCategories().isEmpty()) {
					writer.write("<ul>");
					for (Category cat : category.getSubCategories()) {
						writer.write("<li>");
						writer.write("<a href='" + getRequestContext().getContextPath() + "/kategori/" + cat.getId()
								+ "'>" + cat.getName() + "</a><span class='toplam'>("
								+ advertService.getAllAdvertsByCategoryAndChildCategories(cat.getId()).size()
								+ ")</span>");
						if (!cat.getSubCategories().isEmpty()) {
							writer.write("<ul>");
							for (Category c : cat.getSubCategories()) {
								writer.write("<li>");
								writer.write(
										"<a href='" + getRequestContext().getContextPath() + "/kategori/" + c.getId()
												+ "'>" + c.getName() + "</a><span class='toplam'>(" + advertService
														.getAllAdvertsByCategoryAndChildCategories(c.getId()).size()
												+ ")</span>");
								writer.write("</li>");
							}
							writer.write("</ul>");
							writer.write("</li>");
						}
					}
					writer.write("</ul>");
				} else if (category.getSubCategories().isEmpty()) {
					writer.write("<ul>");
					for (Category c : category.getSubCategories()) {
						writer.write("<li>");
						writer.write("<a href='" + getRequestContext().getContextPath() + "/kategori/" + c.getId()
								+ "'>" + c.getName() + "</a><span class='toplam'>("
								+ advertService.getAllAdvertsByCategoryAndChildCategories(c.getId()).size()
								+ ")</span>");
						writer.write("</li>");
					}
					writer.write("</ul>");
				}
				writer.write("</li>");
				for (Category cat : category.getParentCategory().getSubCategories()) {
					if (!category.getId().equals(cat.getId())) {
						writer.write("<li>");
						writer.write("<a href='" + getRequestContext().getContextPath() + "/kategori/" + cat.getId()
								+ "'>" + cat.getName() + "</a><span class='toplam'>("
								+ advertService.getAllAdvertsByCategoryAndChildCategories(cat.getId()).size()
								+ ")</span>");
						writer.write("</li>");
					}
				}
				writer.write("</ul>");
				writer.write("</li>");
				writer.write("</ul>");
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

	List<Category> recursiveCategory = new ArrayList<>();

	public void recursiveTree(Category cat) {
		if (!cat.getSubCategories().isEmpty()) {
			for (Category c : cat.getSubCategories()) {
				recursiveTree(c);
			}
		}
	}

}
