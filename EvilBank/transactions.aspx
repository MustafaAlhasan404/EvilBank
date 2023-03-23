<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transactions.aspx.cs" Inherits="EvilBank.WebForm7" %>

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
    <form runat="server" id="form9">
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
                        <h2 class="logo-name m-0">Transactions</h2>
                        <a
                            href="#"
                            class="sidebar-toggler flex-shrink-0 bg-secondary rounded-circle">
                            <i class="fa fa-bars p-3"></i>
                        </a>
                    </div>
                    <div class="row g-4 mt-2">
                        <div class="container-fluid p-4 pt-5">
                            <div class="col-12 mb-3 mt-n4">
                                <h4 class="logo-name m-0">Transfer</h4>
                            </div>

                            <div class="g-4">
                                <div class="bg-secondary rounded d-flex g-2 p-2 pt-5">
                                    <div class="row container-fluid g-4">
                                        <div
                                            class="form-floating my-2 col-sm-12 col-xl-3">
                                            <asp:DropDownList ID="transferAccountSelect" CssClass="form-select" runat="server" OnSelectedIndexChanged="transferAccountSelect_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                            <label class="px-4" for="floatingSelect">
                                                Account
                                            </label>
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-3 d-flex align-items-center">
                                            <asp:Label runat="server" Text="Balance:  SYP"></asp:Label>
                                            <asp:Label runat="server" ID="transferBalanceLabel" />
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6 d-flex align-items-center">
                                            <asp:Label runat="server" Text="Recipient Name:"></asp:Label>
                                            <asp:Label runat="server" ID="recipientNameLabel" />
                                        </div>
                                        <div
                                            class="form-floating my-2 col-sm-12 col-xl-3">
                                            <input runat="server"
                                                type="number"
                                                class="form-control"
                                                id="transferAmountInput" />
                                            <label class="px-4" for="floatingSelect">
                                                Amount
                                            </label>
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-3 d-flex align-items-center">
                                            <asp:Label runat="server" ID="balanceAvailabilityLabel" />
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6 d-flex align-items-center">
                                            <asp:Label runat="server" Text="Recipient ID:"></asp:Label>
                                            <asp:Label runat="server" ID="recipientIdLabel" />
                                        </div>
                                        <div
                                            class="form-floating my-2 col-sm-12 col-xl-4">
                                            <input runat="server"
                                                type="number"
                                                class="form-control"
                                                id="recipientAccountIdInput" />
                                            <label class="px-4" for="floatingPassword">
                                                Recipient Account ID</label>
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-2">
                                            <asp:Button
                                                runat="server"
                                                OnClick="selectButton_Click"
                                                Text="Select" class="btn btn-primary d-flex align-items-center justify-content-center logo-name w-100 py-3" />
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6 d-flex align-items-center">
                                            <asp:Label runat="server" Text="Recipient Phone:"></asp:Label>
                                            <asp:Label runat="server" ID="recipientPhoneLabel" />
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6">
                                            <input runat="server"
                                                type="text"
                                                class="form-control"
                                                id="transferNotesInput" />
                                            <label class="px-4" for="floatingPassword">
                                                Notes
                                            </label>
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6 d-flex align-items-center">
                                            <asp:Label runat="server" Text="Recipient Address:"></asp:Label>
                                            <asp:Label runat="server" ID="recipientAddressLabel" />
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-12">
                                            <asp:Label runat="server" ID="transferErrorLabel" CssClass="text-danger"></asp:Label>
                                        </div>
                                        <div class="form-floating my-2 col-sm-12 col-xl-6">
                                            <asp:Button runat="server"
                                                ID="transferButton"
                                                OnClick="transferButton_Click"
                                                Text="Send"
                                                class="btn btn-primary d-flex align-items-center justify-content-center logo-name w-100 py-3" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row g-4 mt-2">
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-secondary rounded h-100 p-4">
                                        <div class="d-flex align-items-start justify-content-between pb-4">
                                            <h6 class="mb-0">Withdraw</h6>
                                        </div>
                                        <div class="row">
                                            <div class="form-floating my-2 col-sm-12 col-xl-6">
                                                <asp:DropDownList ID="withdrawAccountSelect"
                                                    CssClass="form-select" runat="server"
                                                    OnSelectedIndexChanged="withdrawAccountSelect_SelectedIndexChanged"
                                                    AutoPostBack="true" />
                                                <label class="px-4" for="floatingSelect">
                                                    Account
                                                </label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-6 d-flex align-items-center">
                                                <asp:Label runat="server" Text="Balance:  SYP"></asp:Label>
                                                <asp:Label runat="server" ID="withdrawBalanceLabel" />
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-6">
                                                <input runat="server"
                                                    type="number"
                                                    class="form-control"
                                                    id="withdrawAmountInput" />
                                                <label class="px-4" for="floatingSelect">
                                                    Amount
                                                </label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-6">
                                                <input runat="server"
                                                    type="text"
                                                    class="form-control"
                                                    id="withdrawNotesInput" />
                                                <label class="px-4" for="floatingPassword">
                                                    Notes
                                                </label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-12">
                                                <asp:Label runat="server" ID="withdrawErrorLabel" CssClass="text-danger"></asp:Label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-12">
                                                <asp:Button runat="server"
                                                    Text="Withdraw"
                                                    OnClick="withdrawButton_Click"
                                                    class="btn btn-primary d-flex align-items-center justify-content-center logo-name w-100 py-3" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-secondary rounded h-100 p-4">
                                        <div class="d-flex align-items-start justify-content-between pb-4">
                                            <h6 class="mb-0">Deposit</h6>
                                        </div>
                                        <div class="row">
                                            <div class="form-floating my-2 col-sm-12 col-xl-6">
                                                <asp:DropDownList ID="depositAccountSelect" CssClass="form-select" runat="server" OnSelectedIndexChanged="depositAccountSelect_SelectedIndexChanged" AutoPostBack="true">
                                                </asp:DropDownList>
                                                <label class="px-4" for="floatingSelect">
                                                    Account
                                                </label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-6 d-flex align-items-center">
                                                <asp:Label runat="server" Text="Balance:  SYP"></asp:Label>
                                                <asp:Label runat="server" ID="depositBalanceLabel" />
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-6">
                                                <input runat="server"
                                                    type="number"
                                                    class="form-control"
                                                    id="depositAmountInput" />
                                                <label class="px-4" for="floatingSelect">
                                                    Amount
                                                </label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-6">
                                                <input runat="server"
                                                    type="text"
                                                    class="form-control"
                                                    id="depositNotesInput" />
                                                <label class="px-4">
                                                    Notes
                                                </label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-12">
                                                <asp:Label runat="server" ID="depositErrorLabel" CssClass="text-danger"></asp:Label>
                                            </div>
                                            <div class="form-floating my-2 col-sm-12 col-xl-12">
                                                <asp:Button runat="server"
                                                    Text="Deposit"
                                                    OnClick="depositButton_Click"
                                                    class="btn btn-primary d-flex align-items-center justify-content-center logo-name w-100 py-3" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-12 mt-4">
                                <div class="bg-secondary rounded h-100 p-4">
                                    <h6 class="mb-4">All Transactions</h6>
                                    <div class="table-responsive">
                                        <asp:DataGrid 
                                            DataKeyNames="transaction_id" 
                                            CssClass="table table-hover table-striped w-100" 
                                            ID="TransactionsDataGrid" 
                                            runat="server"
                                            DataSourceID="clientTransactionsDataSource">
                                            <Columns>
                                                <asp:TemplateColumn ItemStyle-CssClass="d-flex">
                                                    <ItemTemplate>
                                                        <asp:Button class="btn btn-primary py-2 w-100 mb-4" ID="btnDetails" runat="server" Text="Details" OnClick="btnDetails_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                        <asp:SqlDataSource ID="clientTransactionsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:bankdbConnectionString %>"></asp:SqlDataSource>
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

