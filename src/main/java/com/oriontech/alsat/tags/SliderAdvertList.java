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
public class SliderAdvertList extends RequestContextAwareTag {
	private static final long serialVersionUID = 1L;
	private List<Advert> adverts;

	@Override
	protected int doStartTagInternal() throws Exception {
		final JspWriter writer = pageContext.getOut();
		writer.write("<div uk-slider='finite: true'>");
		writer.write("<div class='uk-position-relative'>");
		writer.write("<div class='uk-slider-container uk-light'>");
		writer.write(
				"<ul class='uk-slider-items uk-grid  uk-child-width-1-2 uk-child-width-1-5@xl uk-child-width-1-4@l uk-child-width-1-4@m uk-child-width-1-3@s'>");
		for (Advert advert : adverts) {
			Photo photo = advert.getPhotos().stream().filter(p -> p.isMainPhoto()).findFirst().orElse(null);

			writer.write("<li><a href='" + getRequestContext().getContextPath() + "/ilan/" + advert.getId() + "'>");
			writer.write("<div class='uk-card uk-card-default uk-card-hover'>");
			writer.write("<div class='uk-card-media-top'>");
			if (photo == null || photo.getName().equals("no_image")) {
				writer.write("<img src='" + getRequestContext().getContextPath()
						+ "/uploads/no_image.jpg' class='card-img-top' style='height:120px;width:100%;object-fit: cover;'>");
			} else {
				writer.write("<img src='" + getRequestContext().getContextPath() + "/uploads/advert_images/"
						+ photo.getName()
						+ "' class='card-img-top'  style='height:120px;width:100%;object-fit: cover;'>");
			}
			writer.write("<div class='uk-text-small uk-text-truncate bg-secondary uk-light pl-2'>");
			writer.write(advert.getBaslik());
			writer.write(" </div> </div>");
			writer.write(" </a> </li>");
		}
		writer.write(" </ul> </div>");
		writer.write(
				"<div class='uk-hidden@s uk-light'><a class='uk-position-center-left uk-position-small' href='#' uk-slidenav-previous uk-slider-item='previous'></a><a class='uk-position-center-right uk-position-small' href='#' uk-slidenav-next uk-slider-item='next'></a></div>");
		writer.write(
				"<div class='uk-visible@s'><a class='uk-position-center-left-out uk-position-small' href='#' uk-slidenav-previous uk-slider-item='previous'></a><a class='uk-position-center-right-out uk-position-small' href='#' uk-slidenav-next uk-slider-item='next'></a></div>");
		writer.write("</div>");
		writer.write("</div>");

		// writer.write("<a href=\"" + getRequestContext().getContextPath() + "/" +
		// category.getId() + "\" >" + category.getName() + "</a>");

		return SKIP_BODY;
	}

}
