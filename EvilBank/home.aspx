<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="EvilBank.WebForm3" %>

<!DOCTYPE html>
<html lang="en">
	<head runat="server">
		<meta charset="utf-8" />
		<title>Bank System</title>
		<meta content="width=device-width, initial-scale=1.0" name="viewport" />

		<link href="img/favicon.ico" rel="icon" />

		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" />
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
			<!-- Sidebar  -->
			<div class="sidebar pe-4 pb-3">
				<nav class="navbar bg-secondary navbar-dark">
					<a href="home.aspx" class="navbar-brand mx-4 mb-3">
						<h3 class="text-primary logo-name">
							<i class="fa fa-chess-knight me-2"></i>EvilBank
						</h3>
					</a>
					<div class="d-flex align-items-center ms-4 mb-4">
						<div class="position-relative">
							<img
								class="rounded-circle"
								src="img/tommy.jpg"
								alt=""
								style="width: 40px; height: 40px"
							/>
							<div
								class="bg-secondary rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"
							></div>
						</div>
						<div class="ms-3">
							<h6 class="mb-0">Thomas Shelby</h6>
							<span>Platinum Client</span>
						</div>
					</div>
					<div class="navbar-nav w-100">
						<hr />
						<a href="home.aspx" class="nav-item nav-link">
							<i class="fa fa-chart-bar me-2"></i>
							My Account
						</a>
						<a href="transfer.aspx" class="nav-item nav-link">
							<i class="fa fa-share-square me-2"></i>Transfer
							Money</a
						>
						<a href="invest.aspx" class="nav-item nav-link"
							><i class="fa fa-coins me-2"></i>Invest</a
						>
						<hr />
						<a href="new.aspx" class="nav-item nav-link"
							><i class="fa fa-user-edit me-2"></i>New Client</a
						>
						<a href="clients.aspx" class="nav-item nav-link"
							><i class="fa fa-users me-2"></i>All Clients</a
						>
					</div>
				</nav>
			</div>

			<div class="content">
				<div class="container-fluid p-4 pt-5">
					<div
						class="col-12 mb-3 d-flex justify-content-between align-items-end mt-n4"
					>
						<h2 class="logo-name m-0">Welcome back, Thomas!</h2>
						<a
							href="#"
							class="sidebar-toggler flex-shrink-0 bg-secondary rounded-circle"
						>
							<i class="fa fa-bars p-3 text-primary"></i>
						</a>
					</div>
					<div class="row g-4">
						<!-- Balance & Balance History -->
						<div class="col-sm-12 col-xl-6">
							<div class="bg-secondary rounded h-100 p-4">
								<div
									class="d-flex align-items-start justify-content-between"
								>
									<div>
										<h6 class="mb-0">Your Balance</h6>
										<h2 class="mb-4 text-primary logo-name">
											$53,560
										</h2>
									</div>
									<a href="#">Show History</a>
								</div>
								<canvas id="line-chart"></canvas>
							</div>
						</div>

						<!-- Transactions -->
						<div class="col-sm-12 col-xl-6">
							<div class="h-100 bg-secondary rounded p-4">
								<div
									class="d-flex align-items-center justify-content-between mb-2"
								>
									<h6 class="mb-0">Transactions</h6>
									<a href="#">Show All</a>
								</div>
								<div
									class="d-flex align-items-center border-bottom py-3"
								>
									<img
										class="rounded-circle flex-shrink-0"
										src="img/saul.jpg"
										alt=""
										style="width: 40px; height: 40px"
									/>
									<div class="w-100 ms-3">
										<div
											class="d-flex w-100 justify-content-between"
										>
											<h6 class="mb-0">Saul Goodman</h6>
											<small class="text-light"
												>2022/10/01</small
											>
											<small class="text-success"
												>+$350.00</small
											>
										</div>
									</div>
								</div>
								<div
									class="d-flex align-items-center border-bottom py-3"
								>
									<img
										class="rounded-circle flex-shrink-0"
										src="img/walter.jpg"
										alt=""
										style="width: 40px; height: 40px"
									/>
									<div class="w-100 ms-3">
										<div
											class="d-flex w-100 justify-content-between"
										>
											<h6 class="mb-0">Walter White</h6>
											<small class="text-light"
												>2022/10/01</small
											>
											<small class="text-danger"
												>-$50.00</small
											>
										</div>
									</div>
								</div>
								<div
									class="d-flex align-items-center border-bottom py-3"
								>
									<img
										class="rounded-circle flex-shrink-0"
										src="img/gus.jpg"
										alt=""
										style="width: 40px; height: 40px"
									/>
									<div class="w-100 ms-3">
										<div
											class="d-flex w-100 justify-content-between"
										>
											<h6 class="mb-0">Gus Fring</h6>
											<small class="text-light"
												>2022/10/01</small
											>
											<small class="text-success"
												>+$1,500.00</small
											>
										</div>
									</div>
								</div>
								<div
									class="d-flex align-items-center border-bottom py-3"
								>
									<img
										class="rounded-circle flex-shrink-0"
										src="img/elon.jpg"
										alt=""
										style="width: 40px; height: 40px"
									/>
									<div class="w-100 ms-3">
										<div
											class="d-flex w-100 justify-content-between"
										>
											<h6 class="mb-0">Elon Musk</h6>
											<small class="text-light"
												>2022/10/01</small
											>
											<small class="text-danger"
												>-$200.00</small
											>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="h-200 bg-secondary rounded mt-4 p-4">
						<h6 class="pb-3">Today's financial quote</h6>
						<h4 class="logo-name">
							<i
								>"The most important thing to do if you find
								yourself in a hole, is to stop digging."</i
							>
						</h4>
						<p>- Warren Buffett</p>
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
		<script src="js/balance.js"></script>
	</body>
</html>