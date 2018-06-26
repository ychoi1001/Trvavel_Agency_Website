<%@ Page Title="Initial Personal Page" Language="C#" AutoEventWireup="true" CodeBehind="InitPage.aspx.cs" Inherits="MapleLeaf2.PersonalPage.InitPage" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Initial Personal Page</title>
    <link href="../Styles/myMaple.css" rel="stylesheet" />
</head>
<body>
    <div style="background-color: lightskyblue; height: 500px; width:100%; margin:0; margin-top:-2%; padding:0;">
        <asp:Literal runat="server" ID="UserName" />
        <asp:PlaceHolder runat="server" ID="ErrorLoginPlz" Visible="false">
            <p class="text-danger">
            <asp:Literal runat="server" ID="FailureText" />
            </p>
        </asp:PlaceHolder>

        <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
        </p>

        <form runat="server">
            <asp:LinkButton Visible="false" runat="server" id="btnLink" href="../Account/Login" CssClass="btn btn-primary btn-sm">Click to log in</asp:LinkButton>
        </form>
    </div>
</body>
</html>