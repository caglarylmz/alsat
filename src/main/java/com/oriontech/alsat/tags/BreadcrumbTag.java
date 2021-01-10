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
public class BreadcrumbTag extends RequestContextAwareTag {
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
			writer.write("<nav class='breadcrumb breadcrumb_type6' aria-label='Breadcrumb'>");
			writer.write("<ol class='breadcrumb__list r-list'>");
			writer.write("<li class='breadcrumb__group'>");
			writer.write("<a href='" + getRequestContext().getContextPath()
					+ "/' class='breadcrumb__point r-link'><span aria-hidden='true'><i class='fas fa-home mr-1'></i></span>Ana Sayfa </a>");
			writer.write("</li>");
			for (Category category : breadcrumbs) {
				writer.write("<li class='breadcrumb__group'>");
				if (breadcrumbs.get(breadcrumbs.size() - 1).equals(category)) {
					writer.write("<a href='" + getRequestContext().getContextPath() + "/kategori/" + category.getId()
							+ "'class='breadcrumb__point r-link'><span aria-current='page'><i class='fas fa-caret-right mr-1 breadcrumb__divider'></i></span>"
							+ " <span class='breadcrumb__point' aria-current='page'>" + category.getName()
							+ "</span></a>");
				} else {
					writer.write("<a href='" + getRequestContext().getContextPath() + "/kategori/" + category.getId()
							+ "' class='breadcrumb__point r-link'><span aria-hidden='true'><i class='fas fa-caret-right mr-1 breadcrumb__divider'></i></span>"
							+ category.getName() + "</a>");
				}
				writer.write("</li>");
			}
			writer.write("</ol>");
			writer.write("</nav>");
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
