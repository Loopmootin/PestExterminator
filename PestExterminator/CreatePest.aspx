<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePest.aspx.cs" Inherits="PestExterminator.CreatePest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <title>Create Pest</title>

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
                    <a class="nav-link" href="http://localhost:51373/CreateCustomer.aspx">Create Customer</a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="http://localhost:51373/CreatePest.aspx">Create Pest <span class="sr-only">(current)</span></a>
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
            <br />
            <asp:GridView ID="GridViewPest" runat="server" CssClass="table table-dark">
            </asp:GridView>
            <br />
            <br />
            <h4>Create a new Pest:</h4>
            <br />


            <div class="form-names">
                <asp:Label ID="LabelName" runat="server" Text="Pest name:" CssClass="label"></asp:Label>
                <asp:Label ID="LabelPrice" runat="server" Text="Price:" CssClass="label"></asp:Label>

                <asp:TextBox ID="TextBoxName" runat="server" CssClass="signup-field"></asp:TextBox>
                <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="signup-field"></asp:TextBox>
            </div>
            <br />

            <asp:Label ID="LabelPicture" runat="server" Text="Picture:" CssClass="label"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxPicture" runat="server" CssClass="signup-field wide-field"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="LabelMessage" runat="server" Text="No message"></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonCreate" runat="server" OnClick="ButtonCreate_Click" Text="Create pest" CssClass="btn btn-outline-secondary" />
                <br />
                <br />
            <br />

            <hr />
            <br />

            <div class="form-names">
                <asp:Label ID="LabelDelete" runat="server" Text="Delete Pest:" CssClass="label"></asp:Label>
                <asp:Label ID="LabelDel" runat="server" Text=" " CssClass="label"></asp:Label>

                <asp:DropDownList ID="DropDownListPests" runat="server" OnSelectedIndexChanged="DropDownListPests_SelectedIndexChanged" CssClass="btn btn-outline-secondary signup-field">
                </asp:DropDownList>
                <asp:Button ID="ButtonDelete" runat="server" OnClick="Button1_Click" Text="Delete pest" CssClass="btn btn-outline-secondary signup-field" />
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
