$(document).ready(
	function () {

		// chart y ekseni son 1 hatfa
		const monthNames = ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
			"Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"
		];
		var currentTime = new Date();	
		var labels = [];
		for(let i=0 ;i<7;i++ ){
			labels.push(currentTime.getDate()-i+ " " +  monthNames[currentTime.getMonth()]);
		}

		// Sales graph chart
		var salesGraphChartCanvas = $('#line-chart').get(0).getContext('2d');
		//$('#revenue-chart').get(0).getContext('2d');

		var salesGraphChartData = {
			labels: labels,
			datasets: [
				{
					label: 'Görüntülenme Sayısı',
					fill: false,
					borderWidth: 2,
					lineTension: 0,
					spanGaps: true,
					borderColor: '#efefef',
					pointRadius: 3,
					pointHoverRadius: 7,
					pointColor: '#efefef',
					pointBackgroundColor: '#efefef',
					data: [1, 2, 1, 3, 3,  2, 0]
				}
			]
		};

		var salesGraphChartOptions = {
			maintainAspectRatio: false,
			responsive: true,
			legend: {
				display: false,
			},
			scales: {
				xAxes: [{
					ticks: {
						fontColor: '#efefef',
					},
					gridLines: {
						display: false,
						color: '#efefef',
						drawBorder: false,
					}
				}],
				yAxes: [{
					ticks: {
						stepSize: 1,
						fontColor: '#efefef',
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
		var salesGraphChart = new Chart(salesGraphChartCanvas, {
			type: 'line',
			data: salesGraphChartData,
			options: salesGraphChartOptions
		});


	});
