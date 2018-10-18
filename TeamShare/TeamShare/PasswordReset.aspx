<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="TeamShare.PasswordReset" %>

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
             if (document.getElementById("txtOldpassword").value == "") {
                 document.getElementById("OldPasswordError").innerHTML = "Please enter old password";

                 ans = false;
             }
             else {
                 document.getElementById("OldPasswordError").innerHTML = "";
             }
             if (document.getElementById("txtNewpassword").value == "") {
                 document.getElementById("NewPasswordError").innerHTML = "Please enter new password";

                 ans = false;
             }
             else {
                 document.getElementById("NewPasswordError").innerHTML = "";
             }
             if (document.getElementById("txtConfirmpassword").value == "") {
                 document.getElementById("ConfirmPasswordError").innerHTML = "Please enter confirm password";

                 ans = false;
             }
             else {
                 document.getElementById("ConfirmPasswordError").innerHTML = "";
             }
             if (document.getElementById("txtConfirmpassword").value != document.getElementById("txtNewpassword").value) {
                 document.getElementById("lblError").innerHTML = "Password is not matching";

                 ans = false;
             }
             else {
                 document.getElementById("lblError").innerHTML = "";
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
                Password Reset</h4>
        </div>
        <div>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx"><h3>Back</h3></asp:HyperLink>
        </div>
        <hr />
        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Old Password" class="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtOldpassword" type="password" runat="server" class="form-control"></asp:TextBox>
                <label ID="OldPasswordError"  class="text-danger"></label>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="New Password" class="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNewpassword" type="password" runat="server" class="form-control"></asp:TextBox>
                <label ID="NewPasswordError"  class="text-danger"></label>
            </div>
        </div>
         <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Confirm Password" class="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtConfirmpassword" type="password" runat="server" class="form-control"></asp:TextBox>
                <label ID="ConfirmPasswordError"  class="text-danger"></label><br />
                <asp:Label ID="lblError" runat="server"  class="text-danger"></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-default"
                    OnClientClick="return myfunc()" onclick="btnReset_Click"  />

            </div>
        </div>
        <hr />
    </div>
    </form>
</body>
</html>
