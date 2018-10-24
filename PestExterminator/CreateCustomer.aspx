<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCustomer.aspx.cs" Inherits="PestExterminator.CreateCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>Create Customer</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <style>
            * {
                font-family: Verdana, Geneva, Tahoma, sans-serif;
            }

            .logo {
                height: 50px;
                width: 50px;
            }

            .jumbotron h2, p {
                text-align: center;
            }

            .form-names {
                display: flex;
                flex-wrap: wrap;
            }

            .form-names input, span, select {
                width: 45%;
                margin-right: 5%;
            }

            .wide-field {
                width: 95%;
            }

            .container {
                display: flex;
            }

            section {
                margin: 0 auto;
            }
        
            .signup-field {
                border: 1px solid black;
                border-radius: 0.25rem;
                padding: 5px 10px;
            }

            .footer {
                height: 150px;
                text-align: center;
            }

            .footer div {
                margin: 0 auto;
                padding-top: 50px;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img class="logo" src="rat.png" alt="logo" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:51373/CreateCustomer.aspx">Create Customer <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:51373/CreatePest.aspx">Create Pest</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Log in</a>
                    </li>
                </ul>
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
                <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
            </form>
            </div>
        </nav>







        <div class="jumbotron">
            <h2>Pest Exterminator</h2>
            <p>Is your house getting invaded by uninvited little guests? <br />Sign up now and book a time, then we will take care of your problem!</p>
        </div>
    
        <form id="form1" runat="server">
            <div class="container">
                <section>
                <br />
                <div class="signup-wrapper">
                    <div class="signupform">
                        <div class="form-names">
                            <asp:Label ID="LabelFirstname" runat="server" Text="Firstname:"></asp:Label>
                            <asp:Label ID="LabelLastname" runat="server" Text="Lastname:"></asp:Label>

                            <asp:TextBox ID="TextBoxFirstname" runat="server" CssClass="signup-field"></asp:TextBox>
                            <asp:TextBox ID="TextBoxLastname" runat="server" CssClass="signup-field"></asp:TextBox>
                        </div>
                        <br />

                        <asp:Label ID="LabelStreet" runat="server" Text="Address:"></asp:Label>
                        <br />
                        <asp:TextBox ID="TextBoxStreet" runat="server" CssClass="signup-field wide-field"></asp:TextBox>
                        <br />
                        <br />

                        <div class="form-names">
                            <asp:Label ID="LabelZip" runat="server" Text="Zip:"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="Town:"></asp:Label>

                            <asp:TextBox ID="TextBoxZip" runat="server" CssClass="signup-field"></asp:TextBox>
                            <asp:TextBox ID="TextBoxTown" runat="server" CssClass="signup-field"></asp:TextBox>
                        </div>
                        <br />

                        <div class="form-names">
                            <asp:Label ID="LabelEmail" runat="server" Text="Email:"></asp:Label>
                            <asp:Label ID="LabelPassword" runat="server" Text="Password:"></asp:Label>

                            <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="signup-field"></asp:TextBox>
                            <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="signup-field"></asp:TextBox>
                        </div>
                        <br />


                        <asp:Button ID="ButtonSignup" runat="server" CssClass="button-green btn btn-outline-dark" Text="Sign Up" OnClick="ButtonSignup_Click" />
                        <br />
                        <br />
                        <asp:Label ID="LabelMessage" runat="server" Text="No messages"></asp:Label>
                    </div>
                </div>
                <br />

                <hr />
                <br />

                <div class="form-names">
                    <asp:Label ID="LabelDelete" runat="server" Text="Delete Customer:" CssClass="label"></asp:Label>
                    <asp:Label ID="LabelDel" runat="server" Text=" " CssClass="label"></asp:Label>

                    <asp:DropDownList ID="DropDownListCustomers" runat="server" OnSelectedIndexChanged="DropDownListCustomers_SelectedIndexChanged" CssClass="btn btn-outline-secondary signup-field">
                    </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" Text="Delete customer" CssClass="btn btn-outline-secondary signup-field" />
                </div>
                <br />
                <br />
            </section>
            </div>
        </form>




        <footer class="footer bg-light">
            <div>
                <a href="#">CphBusiness</a>
                <span>&copy; 2018 Very much a school project</span>
            </div>
        </footer>
    </body>
</html>
