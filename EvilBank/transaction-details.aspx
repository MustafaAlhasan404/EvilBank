<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transaction-details.aspx.cs" Inherits="EvilBank.WebForm13" %>

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
        rel="stylesheet" />

    <link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
        rel="stylesheet" />
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet" />

    <link
        href="lib/owlcarousel/assets/owl.carousel.min.css"
        rel="stylesheet" />
    <link
        href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
        rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
</head>

<body>
    <form runat="server" id="form13">
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Sidebar -->
            <div class="sidebar pe-4 pb-3">
				<nav class="navbar bg-secondary navbar-dark">
					<a href="admin_home.aspx" class="navbar-brand mx-4 mb-3">
						<h3 class="text-primary logo-name">
							<i class="fa fa-chess-knight me-2"></i>EvilBank
						</h3>
					</a>
					<div class="d-flex align-items-center ms-4 mb-4">
						<div class="ms-3">
							<h6 runat="server" id="fullNameLabel" class="mb-0"></h6>
							<span>Admin</span>
						</div>
					</div>
					<div class="navbar-nav w-100">
						<hr />
                        <a href="admin_home.aspx" class="nav-item nav-link"><i class="fa fa-address-book me-2"></i>Dashboard</a>
						<a href="new.aspx" class="nav-item nav-link"><i class="fa fa-user-edit me-2"></i>New Client</a>
						<a href="clients.aspx" class="nav-item nav-link"><i class="fa fa-users me-2"></i>All Clients</a>
						<a href="all-transactions.aspx" class="nav-item nav-link"><i class="fa fa-archive me-2"></i>All Transactions</a>
                        <hr />
					</div>
				</nav>
			</div>

            <div class="content">
                <div class="container-fluid p-4 pt-5">
                    <div
                        class="col-12 mb-3 d-flex justify-content-between align-items-end mt-n4">
                        <h2 class="logo-name m-0">Transaction Details</h2>
                        <a
                            href="#"
                            class="sidebar-toggler flex-shrink-0 bg-secondary rounded-circle">
                            <i class="fa fa-bars p-3"></i>
                        </a>
                    </div>

                    <div class="row g-4 mt-2">
                        <div class="container-fluid p-4 pt-5">

                            <div class="row g-4">
                                <div class="col-sm-12 col-xl-12">
                                    <div class="bg-secondary rounded h-100 p-4">
                                        <div class="row">
                                            <asp:Label runat="server" Text="Transaction ID:" CssClass="col-sm-6 col-xl-3 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="transactionIdLabel" CssClass="col-sm-6 col-xl-3" />
                                            <div class="col-sm-12 col-xl-6"></div>
                                            <asp:Label runat="server" Text="Account ID:" CssClass="col-sm-6 col-xl-3 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="accountIdLabel" CssClass="col-sm-6 col-xl-3" />
                                            <asp:Label runat="server" Text="Receiver Account:" CssClass="col-sm-6 col-xl-3 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="receiverAccountIdLabel" CssClass="col-sm-3 col-xl-1" />
                                            <asp:Label runat="server" ID="receiverAccountTypeLabel" CssClass="col-sm-3 col-xl-2" />
                                            <asp:Label runat="server" Text="Amount:" CssClass="col-sm-6 col-xl-3 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="amoountLabel" CssClass="col-sm-6 col-xl-3" />
                                            <asp:Label runat="server" Text="Receiver Name:" CssClass="col-sm-6 col-xl-3 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="receiverNameLabel" CssClass="col-sm-6 col-xl-3" />
                                            <asp:Label runat="server" Text="Transaction:" CssClass="col-sm-6 col-xl-3 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="transactionTypeLabel" CssClass="col-sm-6 col-xl-3" />
                                            <asp:Label runat="server" Text="Date:" CssClass="col-sm-6 col-xl-3 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="dateLabel" CssClass="col-sm-6 col-xl-3" />
                                            <div class="col-sm-12 col-xl-6"></div>
                                            <asp:Label runat="server" Text="Notes:" CssClass="col-12 text-white" Font-Bold="true" />
                                            <asp:Label runat="server" ID="notesLabel" CssClass="col-12" />
                                        </div>
                                    </div>
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


