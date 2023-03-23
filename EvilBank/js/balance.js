(function ($) {
	("use strict");
	// Balance Line Chart
	var ctx3 = $("#line-chart").get(0).getContext("2d");
	var myChart3 = new Chart(ctx3, {
		type: "line",
		data: {
			labels: [
				"Jan",
				"Feb",
				"Mar",
				"Apr",
				"May",
				"Jun",
				"Jul",
				"Aug",
				"Sep",
				"Oct",
				"Nov",
				"Dec",
			],
			datasets: [
				{
					label: "Account Balance",
					fill: false,
					backgroundColor: "#8e57f7",
					data: [
						50000, 47500, 75000, 77250, 43000, 39800, 44230, 47600,
						22000, 35000, 47300, 53560,
					],
				},
			],
		},
		options: {
			responsive: true,
		},
	});

})(jQuery);
