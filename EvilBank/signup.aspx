<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="EvilBank.WebForm8" %>


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
        <form runat="server" id="form1">
		<div class="container-fluid position-relative d-flex p-0">

				<div class="container-fluid p-4 pt-5">
                    <div class="d-flex w-100 justify-content-between px-4">
                        <div>
                            <h1 class="logo-name">Sign Up</h1>
                            <p>Have an account? <a href="login.aspx">Login</a> instead.</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <h3 class="text-primary logo-name"><i class="fa fa-chess-knight me-2"></i>EvilBank</h3>
                        </div>
                    </div>
					<div class="g-4">
						<div class="bg-secondary rounded d-flex g-2 p-2 pt-5">
							<div class="row container-fluid g-4">
								<div class="form-floating my-2 col-sm-12 col-xl-6">
									<input runat="server"
										type="text"
										class="form-control"
										id="firstNameInput"
										placeholder="John"
									/>
									<label class="px-4" for="floatingInput">
										First Name
									</label>
								</div>
								<div
									class="form-floating my-2 col-sm-12 col-xl-6"
								>
									<input runat="server"
										type="text"
										class="form-control"
										id="lastNameInput"
										placeholder="Doe"
									/>
									<label class="px-4" for="floatingInput"
										>Last Name</label
									>
								</div>
								<div
									class="form-floating my-2 col-sm-12 col-xl-6"
								>
									<input runat="server"
										type="text"
										class="form-control"
										id="phoneInput"
										placeholder="Nationality"
                                        maxlength="10"
									/>
									<label class="px-4" for="floatingPassword"
										>Phone</label
									>
								</div>
								<div
									class="form-floating my-2 col-sm-12 col-xl-6"
								>
									<input runat="server"
										type="number"
										class="form-control"
										id="ageInput"
										placeholder="Age"
                                        required
									/>
									<label class="px-4" for="floatingPassword"
										>Age</label
									>
								</div>
								<div
									class="form-floating my-2 col-sm-12 col-xl-6"
								>
									<select
										class="form-select"
										id="genderSelect"
                                        name="genderSelect"
										aria-label="Floating label select example"
									>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
									<label class="px-4" for="floatingSelect">
										Gender
									</label>
								</div>
								<div
									class="form-floating my-2 col-sm-12 col-xl-6"
								>
									<input runat="server"
										type="email"
										class="form-control"
										id="emailInput"
										placeholder="name@example.com"
									/>
									<label class="px-4" for="floatingInput"
										>Email-address</label
									>
								</div>
								<div
									class="form-floating my-2 col-sm-12 col-xl-6"
								>
									<input runat="server"
										type="text"
										class="form-control"
										id="cityInput"
										placeholder="City"
									/>
									<label class="px-4" for="floatingPassword">
										City
									</label>
								</div>
								<div class="form-floating my-2 col-sm-12 col-xl-6">
									<input runat="server"
										type="text"
										class="form-control"
										id="addressInput"
										placeholder="Address" />
									<label class="px-4" for="floatingInput">Address</label>
								</div>
                                <div class="form-floating my-2 col-sm-12 col-xl-6">
									<input runat="server"
										type="text"
										class="form-control"
										id="usernameInput"
										placeholder="Username" />
									<label class="px-4" for="floatingInput">Username</label>
								</div>
                                <div class="form-floating my-2 col-sm-12 col-xl-6">
									<input runat="server"
										type="text"
										class="form-control"
										id="passwordInput"
										placeholder="Password" />
									<label class="px-4" for="floatingInput">Password</label>
								</div>
                                <div class="form-floating my-2 col-sm-12 col-xl-6">
								    <asp:label runat="server" id="lblError" class="form-check-label text-danger"></asp:label>
                                </div>
                                <div class="form-floating my-2 col-sm-12 col-xl-6">
								    <asp:button runat="server" type="Submit" Text="Create Account" onclick="create_Click" class="btn btn-primary d-flex align-items-center justify-content-center logo-name w-100 py-3" >
								    </asp:button>
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
        </form>
	</body>
</html>
