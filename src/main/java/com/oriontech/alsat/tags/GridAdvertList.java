package com.oriontech.alsat.tags;

import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.oriontech.alsat.models.Advert;
import com.oriontech.alsat.models.Photo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GridAdvertList extends RequestContextAwareTag {
	private static final long serialVersionUID = 1L;
	private List<Advert> adverts;

	@Override
	protected int doStartTagInternal() throws Exception {
		final JspWriter writer = pageContext.getOut();
		for (Advert advert : adverts) {
			Photo photo = advert.getPhotos().stream().filter(p -> p.isMainPhoto()).findFirst().orElse(null);

			writer.write("<div class='column'>");
			writer.write(
					"<a class='btn' href='" + getRequestContext().getContextPath() + "/ilan/" + advert.getId() + "'>");
			writer.write("<div class='card bg-dark text-white h-100'>");
			if (photo == null || photo.getName().equals("no_image")) {
				writer.write("<img src='" + getRequestContext().getContextPath()
						+ "/uploads/no_image.jpg' class='card-img-top' style='height:120px;width:100%;object-fit: cover;'>");
			} else {
				writer.write("<img src='" + getRequestContext().getContextPath() + "/uploads/advert_images/"
						+ photo.getName()
						+ "' class='card-img-top' style='height:120px;width:100%;object-fit: cover;'>");
			}
			writer.write("<div class='card-footer truncate'>" + advert.getBaslik() + "</div>");
			writer.write("</div>");
			writer.write("</a>");
			writer.write("</div>");

		}

		// writer.write("<a href=\"" + getRequestContext().getContextPath() + "/" +
		// category.getId() + "\" >" + category.getName() + "</a>");

		return SKIP_BODY;
	}

}
