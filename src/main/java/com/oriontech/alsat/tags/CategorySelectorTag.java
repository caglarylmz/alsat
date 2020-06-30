package com.oriontech.alsat.tags;

import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.oriontech.alsat.models.Category;
import com.oriontech.alsat.services.CategoryService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CategorySelectorTag extends RequestContextAwareTag {
	private static final long serialVersionUID = 1L;
	private List<Category> categories;

	@Override
	protected int doStartTagInternal() throws Exception {
		JspWriter writer = pageContext.getOut();
		writer.write("<ul class=\"list-group\">");
		for (Category category : categories) {
			writer.write("<li class=\"list-group-item list-group-item-action\" onclick=\"showSubCat(this.id)\" id=\""
					+ category.getId() + "\">" + category.getName() + "</li>");
		}
		writer.write("</ul>");

		return SKIP_BODY;
	}

}
