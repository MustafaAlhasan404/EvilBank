<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="invest.aspx.cs" Inherits="EvilBank.WebForm4" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Bank System</title>
		<meta content="width=device-width, initial-scale=1.0" name="viewport" />

		<link href="img/favicon.ico" rel="icon" />

		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link
			href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
			rel="stylesheet"
		/>

		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
			rel="stylesheet"
		/>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
			rel="stylesheet"
		/>

		<link
			href="lib/owlcarousel/assets/owl.carousel.min.css"
			rel="stylesheet"
		/>
		<link
			href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
			rel="stylesheet"
		/>

		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="css/style.css" rel="stylesheet" />
	</head>

	<body>
		<div class="container-fluid position-relative d-flex p-0">

			<!-- Sidebar -->
			<div class="sidebar pe-4 pb-3">
                    <nav class="navbar bg-secondary navbar-dark">
                        <a href="client_home.aspx" class="navbar-brand mx-4 mb-3">
                            <h3 class="text-primary logo-name">
                                <i class="fa fa-chess-knight me-2"></i>EvilBank
                            </h3>
                        </a>
                        <div class="d-flex align-items-center ms-4 mb-4">
                            <div class="ms-3">
                                <h6 runat="server" id="fullNameLabel" class="mb-0"></h6>
                                <span>Client</span>
                            </div>
                        </div>
                        <div class="navbar-nav w-100">
                            <hr />
                            <a href="client_home.aspx" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>My Account</a>
                            <a href="invest.aspx" class="nav-item nav-link"><i class="fa fa-coins me-2"></i>Invest</a>
                            <a href="transactions.aspx" class="nav-item nav-link"><i class="fa fa-share-square me-2"></i>Transactions</a>
                            <hr />
                        </div>
                    </nav>
                </div>

			<div class="content">
				<div class="container-fluid p-4 pt-5">
					<div
						class="col-12 mb-3 d-flex justify-content-between align-items-end mt-n4"
					>
						<h2 class="logo-name m-0">Invest</h2>
						<a
							href="#"
							class="sidebar-toggler flex-shrink-0 bg-secondary rounded-circle"
						>
							<i class="fa fa-bars p-3"></i>
						</a>
					</div>
				</div>
				<div class="container-fluid mt-n5 px-4">
					<div class="row g-4">
						<div class="col-sm-6 col-xl-3">
							<div
								class="bg-secondary rounded d-flex align-items-center justify-content-between p-4"
							>
								<div class="ms-3">
									<p class="mb-2">Tesla</p>
									<div class="d-flex align-items-center">
										<h6 class="mb-0 me-2">$182.86</h6>
										<i class="fa fa-arrow-alt-circle-up text-success"
										></i>
									</div>
								</div>
								<i
									class="fa fa-chart-line fa-3x text-success"
								></i>
							</div>
						</div>
						<div class="col-sm-6 col-xl-3">
							<div
								class="bg-secondary rounded d-flex align-items-center justify-content-between p-4"
							>
								<div class="ms-3">
									<p class="mb-2">Apple</p>
									<div class="d-flex align-items-center">
										<h6 class="mb-0 me-2">$145.30</h6>
										<i
											class="fa fa-arrow-alt-circle-down text-danger"
										></i>
										<i
											class="fa fa-apple text-danger"
										></i>
									</div>
								</div>
								<i class="fa fa-chart-line fa-3x text-success"></i>
							</div>
						</div>
						<div class="col-sm-6 col-xl-3">
							<div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
								<div class="ms-3">
									<p class="mb-2">Meta</p>
									<div class="d-flex align-items-center">
										<h6 class="mb-0 me-2">$109.47</h6>
										<i
											class="fa fa-arrow-alt-circle-down text-danger"
										></i>
									</div>
								</div>
								<i class="fa fa-chart-line fa-3x text-success"></i>
							</div>
						</div>
						<div class="col-sm-6 col-xl-3">
							<div
								class="bg-secondary rounded d-flex align-items-center justify-content-between p-4"
							>
								<div class="ms-3">
									<p class="mb-2">Amazon</p>
									<div class="d-flex align-items-center">
										<h6 class="mb-0 me-2">$94.88</h6>
										<i
											class="fa fa-arrow-alt-circle-up text-success"
										></i>
									</div>
								</div>
								<i
									class="fa fa-chart-line fa-3x text-success"
								></i>
							</div>
						</div>
					</div>
					<!-- Balance & Balance History -->
					<div class="row g-4 mt-1">
						<div class="col-sm-12 col-xl-7">
							<div class="bg-secondary rounded h-100 p-4">
								<div
									class="d-flex align-items-start justify-content-between"
								>
									<h6>Your Portfolio (YTD)</h6>
									<h2 class="mb-4 text-primary logo-name">
										$13,560
									</h2>
								</div>
								<canvas id="port-line-chart"></canvas>
							</div>
						</div>
							<div class="col-sm-12 col-xl-5">
								<div class="bg-secondary rounded h-100 p-4 d-flex flex-column">
									<div
										class="d-flex align-items-start justify-content-between"
									>
										<h6>Your Holdings</h6>
									</div>
									<canvas id="doughnut-chart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="row h-200 bg-secondary rounded m-4 p-4">
						<h6 class="pb-3">Today's investment quote</h6>
						<h4 class="logo-name">
							<i
								>"Time in the market beats timing the market"</i
							>
						</h4>
						<p>- Ken Fisher</p>
					</div>
				</div>
			</div>
		</div>

		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		<script src="lib/chart/chart.min.js"></script>
		<script src="lib/easing/easing.min.js"></script>
		<script src="lib/waypoints/waypoints.min.js"></script>
		<script src="lib/owlcarousel/owl.carousel.min.js"></script>
		<script src="lib/tempusdominus/js/moment.min.js"></script>
		<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
		<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

		<script src="js/main.js"></script>
		<script src="js/portfolio.js"></script>
	</body>
</html>
