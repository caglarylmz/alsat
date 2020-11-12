package com.oriontech.alsat.tags;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.oriontech.alsat.models.Category;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BreadcrumbAlternative extends RequestContextAwareTag {
	private static final long serialVersionUID = 1L;
	private Category category;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (category == null) {
			WebApplicationContext webApplicationContext = getRequestContext().getWebApplicationContext();
			AutowireCapableBeanFactory acbf = webApplicationContext.getAutowireCapableBeanFactory();
			acbf.autowireBean(this);
		}

		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		final List<Category> breadcrumbs = getParentCategory(this.category);
		final JspWriter writer = pageContext.getOut();
		try {
			writer.write("<div class='container'>");
			writer.write("<ul class='breadcrumbs'>");
			writer.write("<li class='first'><a href=" + getRequestContext().getContextPath() + "/h"
					+ " class='icon-home'><i class='fas fa-home'></i></a></li>");
			for (Category category : breadcrumbs) {
				if (breadcrumbs.get(breadcrumbs.size() - 1).equals(category)) {
					writer.write("<li class='last active'><a href=" + getRequestContext().getContextPath()
							+ "/h/kategori/" + category.getId() + ">" + category.getName() + "</a></li>");
				} else {
					writer.write("<li><a href=" + getRequestContext().getContextPath() + "/h/kategori/"
							+ category.getId() + ">" + category.getName() + "</a></li>");
				}

			}
			writer.write("</ul>");
			writer.write("</div>");
		} catch (Exception e) {
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}

	}

	List<Category> getParentCategory(Category category) {
		final List<Category> getParents = new ArrayList<>();
		getParents.add(category);
		while (category.getParentCategory() != null) {
			category = category.getParentCategory();
			getParents.add(category);
		}

		Collections.reverse(getParents);
		return getParents;
	}
}
