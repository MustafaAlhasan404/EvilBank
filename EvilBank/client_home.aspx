<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client_home.aspx.cs" Inherits="EvilBank.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid position-relative d-flex p-0">
                <!-- Sidebar  -->
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
                            class="col-12 mb-3 d-flex justify-content-between align-items-end mt-n4">
                            <h2 class="logo-name m-0">Welcome back, <span runat="server" id="firstNameLabel"></span></h2>
                            <a
                                href="#"
                                class="sidebar-toggler flex-shrink-0 bg-secondary rounded-circle">
                                <i class="fa fa-bars p-3 text-primary"></i>
                            </a>
                        </div>
                        <div class="row g-4">
                            <div class="col-sm-12 col-xl-6">
                                <div class="h-100 bg-secondary rounded p-4">
                                    <div class="d-flex align-items-start justify-content-between pb-3">
                                        <h6 class="mb-0">My Accounts</h6>
                                    </div>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="ClientAccountsDataSource" CellPadding="10" Width="100%" ShowHeaderWhenEmpty="true">
                                        <Columns>
                                            <asp:BoundField DataField="account_id" HeaderText="ID/Number" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                                            <asp:BoundField DataField="account_type" HeaderText="Name" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                                            <asp:BoundField DataField="balance" HeaderText="Balance" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="ClientAccountsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:bankdbConnectionString %>" SelectCommand="SELECT * FROM [accounts]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-secondary rounded  p-4">
                                    <div class="mb-5">
                                        <h6>Create New Account</h6>
                                    </div>
                                    <div class="row container-fluid g-4 pb-5">
                                        <div
                                            class="form-floating my-2 col-12">
                                            <input runat="server"
                                                type="text"
                                                class="form-control"
                                                id="accountTypeInput" />
                                            <label class="px-4">
                                                Account Name/Type</label>
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6">
                                            <input runat="server"
                                                type="number"
                                                class="form-control"
                                                id="startingBalanceInput" />
                                            <label class="px-4" for="floatingSelect">
                                                Starting Balance
                                            </label>
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6">
                                            <asp:Button runat="server"
                                                ID="transferButton"
                                                OnClick="createAccountButton_Click"
                                                Text="Create"
                                                class="btn btn-primary d-flex align-items-center justify-content-center logo-name w-100 py-3" />
                                        </div>
                                        <asp:Label runat="server" CssClass="text-danger" ID="createAccountErrorLabel"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-12">
                                <div class="h-100 bg-secondary rounded p-4">
                                    <div class="d-flex align-items-start justify-content-between pb-3">
                                        <h6 class="mb-0">My Latest Transactions</h6>
                                        <a href="transactions.aspx">Show All</a>
                                    </div>
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="transaction_id" DataSourceID="clientTransactionsDataSource" CssClass="w-100" AllowSorting="true" ShowHeaderWhenEmpty="true" AllowPaging="true" PageSize="5">
                                            <Columns>
                                                <asp:BoundField DataField="transaction_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="transaction_id" />
                                                <asp:BoundField DataField="account_type" HeaderText="Account" SortExpression="account_id" />
                                                <asp:BoundField DataField="transaction_type" HeaderText="Transaction" SortExpression="transaction_type" />
                                                <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="clientTransactionsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:bankdbConnectionString %>" SelectCommand="SELECT * FROM [transactions]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="h-200 bg-secondary rounded mt-4 p-4">
                            <h6 class="pb-3">Today's financial quote</h6>
                            <h4 class="logo-name">
                                <i>"The most important thing to do if you find
								yourself in a hole, is to stop digging."</i>
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
        </div>
    </form>
</body>
</html>

