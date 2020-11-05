<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div id="app">
	<div class="content-wrapper">
		<!-- Main content -->
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-body">

					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active">
							<a class="persistant-disabled" href="#stepper-step-1" data-toggle="tab"
								aria-controls="stepper-step-1" role="tab" title="Step 1">
								<span class="round-tab">1</span>
							</a>
						</li>
						<li role="presentation" class="disabled">
							<a class="persistant-disabled" href="#stepper-step-2" data-toggle="tab"
								aria-controls="stepper-step-2" role="tab" title="Step 2">
								<span class="round-tab">2</span>
							</a>
						</li>
						<li role="presentation" class="disabled">
							<a class="persistant-disabled" href="#stepper-step-3" data-toggle="tab"
								aria-controls="stepper-step-3" role="tab" title="Step 3">
								<span class="round-tab">3</span>
							</a>
						</li>
						<li role="presentation" class="disabled">
							<a class="persistant-disabled" href="#stepper-step-4" data-toggle="tab"
								aria-controls="stepper-step-4" role="tab" title="Complete">
								<span class="round-tab">4</span>
							</a>
						</li>
					</ul>
					<form role="form">
						<div class="tab-content">
							<div class="tab-pane fade in active" role="tabpanel" id="stepper-step-1">
								<h3 class "h2">1. Select Payment Type</h3>
								<p>This is step 1</p>
								<ul class="list-inline pull-right">
									<li>
										<a class="btn btn-primary next-step">Next</a>
									</li>
								</ul>
							</div>
							<div class="tab-pane fade" role="tabpanel" id="stepper-step-2">
								<h3 class "h2">2. Enter Payment Information</h3>
								<p>This is step 2</p>
								<ul class="list-inline pull-right">
									<li>
										<a class="btn btn-default prev-step">Back</a>
									</li>
									<li>
										<a class="btn btn-primary next-step">Next</a>
									</li>
								</ul>
							</div>
							<div class="tab-pane fade" role="tabpanel" id="stepper-step-3">
								<h3 class="hs">3. Review and Submit Payment</h3>
								<p>This is step 3</p>
								<ul class="list-inline pull-right">
									<li>
										<a class="btn btn-default prev-step">Back</a>
									</li>
									<li>
										<a class="btn btn-default cancel-stepper">Cancel Payment</a>
									</li>
									<li>
										<a class="btn btn-primary next-step">Submit Payment</a>
									</li>
								</ul>
							</div>
							<div class="tab-pane fade" role="tabpanel" id="stepper-step-4">
								<h3>4. All done!</h3>
								<p>You have successfully completed all steps.</p>
							</div>
						</div>
					</form>
				</div>


			</div>
		</div>
	</div>
</div>

<script>
	(function ($) {
		'use strict';

		$(function () {

			$(document).ready(function () {
				function triggerClick(elem) {
					$(elem).click();
				}
				var $progressWizard = $('.stepper'),
					$tab_active,
					$tab_prev,
					$tab_next,
					$btn_prev = $progressWizard.find('.prev-step'),
					$btn_next = $progressWizard.find('.next-step'),
					$tab_toggle = $progressWizard.find('[data-toggle="tab"]'),
					$tooltips = $progressWizard.find('[data-toggle="tab"][title]');

				// To do:
				// Disable User select drop-down after first step.
				// Add support for payment type switching.

				//Initialize tooltips
				$tooltips.tooltip();

				//Wizard
				$tab_toggle.on('show.bs.tab', function (e) {
					var $target = $(e.target);

					if (!$target.parent().hasClass('active, disabled')) {
						$target.parent().prev().addClass('completed');
					}
					if ($target.parent().hasClass('disabled')) {
						return false;
					}
				});

				// $tab_toggle.on('click', function(event) {
				//     event.preventDefault();
				//     event.stopPropagation();
				//     return false;
				// });

				$btn_next.on('click', function () {
					$tab_active = $progressWizard.find('.active');

					$tab_active.next().removeClass('disabled');

					$tab_next = $tab_active.next().find('a[data-toggle="tab"]');
					triggerClick($tab_next);

				});
				$btn_prev.click(function () {
					$tab_active = $progressWizard.find('.active');
					$tab_prev = $tab_active.prev().find('a[data-toggle="tab"]');
					triggerClick($tab_prev);
				});
			});
		});

	}(jQuery, this));
</script>

<style scoped>
	.nav-tabs {
		position: relative;
	}

	.nav-tabs>li {
		width: 25%;
		position: relative;
	}

	.nav-tabs>li:after {
		content: '';
		position: absolute;
		background: #f1f1f1;
		display: block;
		width: 100%;
		height: 5px;
		top: 30px;
		left: 50%;
		z-index: 1;
	}

	.nav-tabs>li.completed::after {
		background: #34bc9b;
	}

	.nav-tabs>li.last-child::after {
		background: transparent;
	}

	.nav-tabs>li.active:last-child .round-tab {
		background: #34bc9b;

	}

	.nav-tabs>li.active:last-child .round-tab ::after {
		content: '✔';
		color: #fff;
		position: absolute;
		left: 0;
		right: 0;
		margin: 0 auto;
		top: 0;
		display: block;
	}

	.nav-tabs [data-toggle='tab'] {
		width: 25px;
		height: 25px;
		margin: 20px auto;
		border-radius: 100%;
		border: none;
		padding: 0;
		color: #f1f1f1;
	}

	.nav-tabs [data-toggle='tab']:hover {
		background: transparent;
		border: none;
	}

	.nav-tabs>.active>[data-toggle='tab'],
	.nav-tabs>.active>[data-toggle='tab']:hover,
	.nav-tabs>.active>[data-toggle='tab']:focus {
		color: #34bc9b;
		cursor: default;
		border: none;
	}

	.tab-pane {
		position: relative;
		padding-top: 50px;
	}

	.round-tab {
		width: 25px;
		height: 25px;
		line-height: 22px;
		display: inline-block;
		border-radius: 25px;
		background: #fff;
		border: 2px solid #34bc9b;
		color: #34bc9b;
		z-index: 2;
		position: absolute;
		left: 0;
		text-align: center;
		font-size: 14px;

	}

	.completed .round-tab {
		background: #34bc9b;
	}

	.completed .round-tab::after {
		content: '✔';
		color: #fff;
		position: absolute;
		left: 0;
		right: 0;
		margin: 0 auto;
		top: 0;
		display: block;
	}

	.active .round-tab {
		background: #fff;
		border: 2px solid #34bc9b;
	}

	.active .round-tab:hover {
		background: #fff;
		border: 2px solid #34bc9b;
	}

	.active .round-tab::after {
		display: none;
	}

	.disabled .round-tab {
		background: #fff;
		color: #f1f1f1;
		border-color: #f1f1f1;
	}

	.disabled .round-tab:hover {
		color: #4dd3b6;
		border: 2px solid #a6dfd3;
	}

	.disabled .round-tab::after {
		display: none;
	}
</style>
<!-- /.card -->