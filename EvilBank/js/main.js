(function ($) {
	("use strict");

	// Back to top button
	$(window).scroll(function () {
		if ($(this).scrollTop() > 300) {
			$(".back-to-top").fadeIn("slow");
		} else {
			$(".back-to-top").fadeOut("slow");
		}
	});
	$(".back-to-top").click(function () {
		$("html, body").animate({ scrollTop: 0 }, 1500, "easeInOutExpo");
		return false;
	});

	// Sidebar Button
	$(".sidebar-toggler").click(function () {
		$(".sidebar, .content").toggleClass("open");
		return false;
	});


	// Calender
	$("#calender").datetimepicker({
		inline: true,
		format: "L",
	});

	// Chart Global Color
	Chart.defaults.color = "#6C7293";
	Chart.defaults.borderColor = "#000000";



})(jQuery);

