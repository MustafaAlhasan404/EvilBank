<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transfare.aspx.cs" Inherits="EvilBank.WebForm7" %>

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
		<form runat="server">
			<div class="container-fluid position-relative d-flex p-0">
			<!-- Sidebar -->
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
					<!-- Welcome message -->
					<div
						class="col-12 mb-3 d-flex justify-content-between align-items-end mt-n4"
					>
						<h2 class="logo-name m-0">Transfer Money</h2>
						<a
							href="#"
							class="sidebar-toggler flex-shrink-0 bg-secondary rounded-circle"
						>
							<i class="fa fa-bars p-3"></i>
						</a>
					</div>
					<div class="row g-4">
						<div class="col-sm-4 col-xl-2">
							<div
								class="bg-secondary rounded d-flex flex-column align-items-center justify-content-between p-4"
							>
								<img
									src="./img/elon.jpg"
									class="rounded-circle flex-shrink-0 mb-2"
									style="height: 80px; width: 80px"
								/>
								<p class="mb-2">Elon Musk</p>
								<button
									type="button"
									class="btn btn-primary m-2"
								>
									Send
								</button>
							</div>
						</div>
						<div class="col-sm-4 col-xl-2">
							<div
								class="bg-secondary rounded d-flex flex-column align-items-center justify-content-between p-4"
							>
								<img
									src="./img/martin.jpg"
									class="rounded-circle flex-shrink-0 mb-2"
									style="height: 80px; width: 80px"
								/>
								<p class="mb-2">Martin Shkreli</p>
								<button
									type="button"
									class="btn btn-primary m-2"
								>
									Send
								</button>
							</div>
						</div>
						<div class="col-sm-4 col-xl-2">
							<div
								class="bg-secondary rounded d-flex flex-column align-items-center justify-content-between p-4"
							>
								<img
									src="./img/bobby.jpg"
									class="rounded-circle flex-shrink-0 mb-2"
									style="height: 80px; width: 80px"
								/>
								<p class="mb-2">Bobby Axelrod</p>
								<button
									type="button"
									class="btn btn-primary m-2"
								>
									Send
								</button>
							</div>
						</div>
						<div class="col-sm-4 col-xl-2">
							<div
								class="bg-secondary rounded d-flex flex-column align-items-center justify-content-between p-4"
							>
								<img
									src="./img/gus.jpg"
									class="rounded-circle flex-shrink-0 mb-2"
									style="height: 80px; width: 80px"
								/>
								<p class="mb-2">Gus Fring</p>
								<button
									type="button"
									class="btn btn-primary m-2"
								>
									Send
								</button>
							</div>
						</div>
						<div class="col-sm-4 col-xl-2">
							<div
								class="bg-secondary rounded d-flex flex-column align-items-center justify-content-between p-4"
							>
								<img
									src="./img/saul.jpg"
									class="rounded-circle flex-shrink-0 mb-2"
									style="height: 80px; width: 80px"
								/>
								<p class="mb-2">Saul Goodman</p>
								<button
									type="button"
									class="btn btn-primary m-2"
								>
									Send
								</button>
							</div>
						</div>
						<div class="col-sm-4 col-xl-2">
							<div
								class="bg-secondary rounded d-flex flex-column align-items-center justify-content-between p-4"
							>
								<img
									src="./img/walter.jpg"
									class="rounded-circle flex-shrink-0 mb-2"
									style="height: 80px; width: 80px"
								/>
								<p class="mb-2">Walter White</p>
								<button
									type="button"
									class="btn btn-primary m-2"
								>
									Send
								</button>
							</div>
						</div>
					</div>

					<div class="row g-4 mt-2">
						<div class="col-sm-12 col-xl-8">
							<div class="bg-secondary rounded h-100 p-4">
								<div
									class="d-flex align-items-start justify-content-between"
								>
									<h6 class="mb-0">Your Balance</h6>
								</div>
								<%-- first needed info --%>
								<div class="form-floating my-2">
									<select
										runat="server"
										class="form-select"
										id="AccountType"
										aria-label="Floating label select example"
									>
										<option value="1">Checking</option>
										<option value="2">Saving</option>
										<option value="3">Investment</option>
									</select>
									<label class="px-4" for="floatingSelect">
										Account
									</label>
								</div>
								<div
									class="input-group my-2 d-flex align-items-center"
								>
									<span
										class="text-primary"
										style="margin: 0px 25px"
									>
										Amount
									</span>
									<span
										class="input-group-text"
										id="basic-addon3"
										style="color: black"
									>
										$
									</span>
									<%-- sec needed info --%>
									<input
										runat="server"
										type="number"
										class="form-control"
										id="NumberAmount"
										aria-describedby="basic-addon3"
									/>
								</div>
								<%-- third needed info --%>
								<div class="form-floating my-2">
									<input
										runat="server"
										type="text"
										class="form-control"
										id="Id_R"
										placeholder="Password"
									/>
									<asp:label runat="server" class="px-4" for="floatingPassword">
										ReciverID
									</asp:label>
								</div>
								<%-- forth needed info --%>
								<div class="form-floating my-2">
									<input
										runat="server"
										type="number"
										class="form-control"
										id="AccountNumber"
										placeholder="Password"
									/>
									<asp:label runat="server" class="px-4" for="floatingPassword">
										Account Number
									</asp:label>
								</div>
								<%-- fifth needed info --%>
								<div class="form-floating my-2">
									<input
										runat="server"
										type="number"
										class="form-control"
										id="Notes"
										placeholder="Password"
									/>
									<asp:label runat="server" class="px-4" for="floatingPassword">
										Notes
									</asp:label>
								</div>
								<%--button of Submit--%>
								<asp:Button ID="Button2" type="submit" runat="server" Text="Send" OnClick="Button2_Click" class="btn btn-primary py-3 w-100 mb-4"/>
							</div>
						</div>
						<div class="col-sm-12 col-xl-4">
							<div
								class="h-100 bg-secondary rounded p-4 d-flex flex-column"
							>
								<div
									class="d-flex align-items-center justify-content-between mb-5"
								>
									<h6 class="mb-0">Schedule Transfer</h6>
								</div>
								<div id="calender"></div>
							</div>
						</div>
					</div>
					<div class="col-12 mt-4">
						<div class="bg-secondary rounded h-100 p-4">
							<h6 class="mb-4">All Transactions</h6>
							<div class="table-responsive">
							<asp:DataGrid CssClass="table table-hover table-striped w-100" ID="DataGrid2" runat="server" DataSourceID="bankdb" Width="500px" Height="214px" CellPadding="5" BorderWidth="5px" GridLines="both" CaptionAlign="Bottom" HorizontalAlign="Center" CellSpacing="5" AutoGenerateColumns="True" BorderStyle="Solid" HeaderStyle-BorderStyle="Solid" UseAccessibleHeader="True">
                                    </asp:DataGrid>
                            <asp:sqldatasource ID="bankdb" runat="server" ConnectionString="<%$ ConnectionStrings:bankdbConnectionString %>" SelectCommand="SELECT * FROM [transactions]"></asp:sqldatasource>
							</div>
						</div>
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
		</form>
	</body>
</html>
