<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TeamShare.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/Site.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">

        function myfunc() {
            var ans;
            if (document.getElementById("txtUsername").value == "") {
                document.getElementById("usernameError").innerHTML = "Please enter Employee ID";

                ans = false;
            }
            else {
                document.getElementById("usernameError").innerHTML = "";
            }
            if (document.getElementById("txtPassword").value == "") {
                document.getElementById("passwordError").innerHTML = "Please enter password";

                ans = false;
            }
            else {
                document.getElementById("passwordError").innerHTML = "";
            }

            return ans;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-inverse navbar-fixed-top">
        <br />
        <h1 style="color: white; font-family: Times New Roman">
            <b>MM FILE SHARING CENTER</b></h1>
    </div>
    <br />
    <div class="form-horizontal">
        <div>
            <h4>
                User Login</h4>
        </div>
        <hr />
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Employee ID" class="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtUsername" runat="server" class="form-control"></asp:TextBox>
                <label ID="usernameError"  class="text-danger"></label>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Password" class="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control"></asp:TextBox>
                <label ID="passwordError" runat="server" class="text-danger">
                </label>
                      <asp:Label
                    ID="Errormsg" runat="server" class="text-danger" ></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label3" runat="server"  class="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
               &nbsp; <asp:CheckBox ID="CheckBoxRemember" runat="server" Checked="true"/> &nbsp;&nbsp;Remember me
                
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-default"
                    OnClientClick="return myfunc()" onclick="btnLogin_Click" />

            </div>
        </div>
        <hr />
    </div>

    </form>
</body>
</html>
