<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TeamShare.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#btnUpload").click(function () {
                if ($("#FileUpload1").val() == "") {
                    alert('Please choose a file');
                }
            });

            $("#btnSerach").click(function () {

                if ($("#txtSearch").val() == "") {
                    alert("Please enter search term");
                }
            });

            $("#HeaderDiv").click(function () {
                //location.reload();
                //history.go(0);
                window.location.href = window.location.href;
            })
            
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="HeaderDiv" style="background-color: #5D7B9D;cursor:pointer">
        <h1 style="color: White;font-family:Times New Roman">
            MM FILE SHARING CENTER</h1>
    </div>
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" Width="399px" />&nbsp;&nbsp;<asp:Button
            ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" BackColor="#5D7B9D"
            ForeColor="White" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtSearch" runat="server" Width="250px"></asp:TextBox>
        <asp:Button ID="btnSerach" runat="server" Text="Search" BackColor="#5D7B9D" 
            ForeColor="White" onclick="btnSerach_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Label ID="userid" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:ImageButton
        ID="btnPasswordChange" runat="server"   Height="20px"     Width="20px" 
        ImageUrl="Content/password.png" title="change password" 
            onclick="btnPasswordChange_Click" />&nbsp;
            <asp:ImageButton
                ID="BtnLogOut" runat="server" Height="16px" Width="26px" ImageUrl="Content/logout.jpg"
                title="logout" onclick="BtnLogOut_Click"  />
    </div>
    <div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1270px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="File">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>'
                            CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:BoundField DataField="Size" HeaderText="Size">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Type" HeaderText="Type">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
    </div>
    </form>
</body>
</html>
