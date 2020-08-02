$(document).ready(
	function () {

		/**Popover */
		$('[data-toggle="popover"]').popover({
			trigger: 'hover'
		});
		/**Popover */

		/**USER PANEL CHART ADVERT */
		var lastAdvert = '';
		var views = [];
		const labels = [];
		const viewdAts = [];

		// Sales graph chart
		var advertGraphChartCanvas = $('#line-chart').get(0).getContext('2d');
		//$('#revenue-chart').get(0).getContext('2d');
		var advertGraphChartData = {
			labels: labels,
			datasets: [
				{
					label: 'Görüntülenme Sayısı',
					fill: false,
					borderWidth: 2,
					lineTension: 0,
					spanGaps: true,
					borderColor: '#007bff',
					pointRadius: 3,
					pointHoverRadius: 7,
					pointColor: '#007bff',
					pointBackgroundColor: '#007bff',
					data: viewdAts
				}
			]
		};

		var advertGraphChartOptions = {
			maintainAspectRatio: false,
			responsive: true,
			legend: {
				display: false,
			},
			scales: {
				xAxes: [{
					ticks: {
						fontColor: '#343a40',
					},
					gridLines: {
						display: false,
						color: '#343a40',
						drawBorder: false,
					}
				}],
				yAxes: [{
					ticks: {
						stepSize: 1,
						fontColor: '#343a40',
						beginAtZero: true
					},
					gridLines: {
						display: true,
						color: '#efefef',
						drawBorder: false,
					}
				}]
			}
		};

		// This will get the first returned node in the jQuery collection.
		var advertGraphChart = new Chart(advertGraphChartCanvas, {
			type: 'line',
			data: advertGraphChartData,
			options: advertGraphChartOptions
		});


		$.ajax({
			type: 'GET',
			url: '/api/adverts/user',
			success: function (result) {
				var res = $.parseJSON(JSON.stringify(result));
				views = res.views;
				for (let index = 0; index < views.length; index++) {
					labels.push(views[index].viewedAt.substring(0, views[index].viewedAt.length - 5));
					viewdAts.push(views[index].howManyViewedAt);
				}

				advertGraphChart.update();
			},
			error: function (msg) {
				console.log("failed");
			}
		});

	});
