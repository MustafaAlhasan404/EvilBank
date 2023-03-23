<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="all-transactions.aspx.cs" Inherits="EvilBank.WebForm10" %>

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
    <form id="form1" runat="server" class="">
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
                        <a href="admin_home.aspx" class="nav-item nav-link"><i class="fa fa-user-edit me-2"></i>Dashboard</a>
                        <a href="new.aspx" class="nav-item nav-link"><i class="fa fa-user-edit me-2"></i>New Client</a>
                        <a href="clients.aspx" class="nav-item nav-link"><i class="fa fa-users me-2"></i>All Clients</a>
                        <a href="all-transactions.aspx" class="nav-item nav-link"><i class="fa fa-user-edit me-2"></i>All Transactions</a>
                        <hr />
                    </div>
                </nav>
            </div>


            <div class="content">
                <div
                    class="navbar navbar-expand navbar-dark bg-secondary sticky-top px-4 py-0">
                </div>
                <div class="container-fluid p-4 pt-5">
                    <div
                        class="col-12 mb-3 d-flex justify-content-between align-items-end mt-n4">
                        <h2 class="logo-name m-0">All Transactions</h2>
                        <a
                            href="#"
                            class="sidebar-toggler flex-shrink-0 bg-secondary rounded-circle">
                            <i class="fa fa-bars p-3"></i>
                        </a>
                    </div>
                    <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <div class="table-responsive">
                                <asp:DataGrid
                                    DataKeyNames="transaction_id"
                                    CssClass="table table-hover table-striped w-100"
                                    ID="TransactionsDataGrid"
                                    runat="server" DataSourceID="clientTransactionsDataSource">
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
                        &nbsp;
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
    </form>

</body>
</html>

