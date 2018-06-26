<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogoutPage.aspx.cs" Inherits="MapleLeaf2.LogoutPage" Async="true" %>


<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log out Page</title>
    <link href="../Styles/myMaple.css" rel="stylesheet" />
</head>
<body>
    <div style="height: 500px; width:100%; margin:0; margin-top:-2%; padding:0;">

        <h3>Your account is deleted.</h3>

    </div>
</body>
</html>--%>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- PAGE CONTENTS-->
    <div class="row">

        <!-- LEFT: MENU -->
        <div class="col-sm-2 col-xs-11 myMapleMenu" >
            <asp:Button runat="server" Text="My Trips" ID="btnTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" Text="My Postings" ID="btnPostings" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" Text="My Profile" ID="btnMyProfile" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" Text="Account Settings" ID="btnSetting" CssClass="btn btn-default btnMaple" /><br />
        </div>

        <!-- RIGHT: CONTENTS -->
        <div class="col-sm-9 col-xs-11 myMapleContents" >
             
            <h3>Your account is deleted now.</h3>

            <a href="Account/Register">Click here to register again</a>
            
        </div>

    </div>

</asp:Content>