package com.oriontech.alsat.tags;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.jsp.JspWriter;

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
		final List<Category> breadcrumbs = getParentCategoryFromAdvert(this.category);
		final JspWriter writer = pageContext.getOut();
		writer.write("<nav aria-label=\"breadcrumb\">");
		writer.write("<ol class=\"breadcrumb\">");
		for (final Category category : breadcrumbs) {
			writer.write("<li class=\"breadcrumb-item\">");
			// TODO: tıklanıldığında gidilecek link yazılacak
			writer.write("<a href=\"" +getRequestContext().getContextPath() + "/"+ category.getId() + "\" >" + category.getName() + "</a>");
			writer.write("</li>");
		}
		writer.write("</ol>");
		writer.write("</nav>");

		return SKIP_BODY;
	}

	List<Category> getParentCategoryFromAdvert(Category category) {
		final List<Category> advertsParentsCategories = new ArrayList<>();
		advertsParentsCategories.add(category);
		do {
			category = category.getParentCategory();
			advertsParentsCategories.add(category);
		} while (category.getParentCategory() != null);
		Collections.reverse(advertsParentsCategories);
		return advertsParentsCategories;
	}
}
