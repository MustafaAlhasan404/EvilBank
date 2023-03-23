(function ($) {
	("use strict");
	// Portfolio Line Chart
	var ctx4 = $("#port-line-chart").get(0).getContext("2d");
	var myChart4 = new Chart(ctx4, {
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
			],
			datasets: [
				{
					label: "Portfolio Value",
					fill: false,
					backgroundColor: "#8e57f7",
					data: [
						7000, 7500, 8000, 4950, 5600, 7980, 8423, 8760, 8200,
						11500, 13560,
					],
				},
			],
		},
		options: {
			responsive: true,
		},
	});

	// Doughnut Chart
	var ctx6 = $("#doughnut-chart").get(0).getContext("2d");
	var myChart6 = new Chart(ctx6, {
		type: "doughnut",
		data: {
			labels: ["$TSLA", "$META", "$BRK", "$GOOG", "Others"],
			datasets: [
				{
					backgroundColor: [
						"#5232e3",
						"#8e57f7",
						"#402aa1",
						"#39297d",
						"#271c59",
					],
					data: [1000, 253, 850, 400, 2000],
				},
			],
		},
		options: {
			responsive: true,
			borderWidth: 2,
			borderColor: "#000000",
		},
	});
})(jQuery);