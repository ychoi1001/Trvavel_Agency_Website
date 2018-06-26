<%@ Page Title="MyMaple" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyMaple.aspx.cs" Inherits="MapleLeaf2.MyMaple" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<h2><%: Title %></h2>--%>
    
    <!-- TOP: PAGE HEADING -->
    <h3>My Maple</h3>
    
    <!-- PAGE CONTENTS-->
    <div class="row">

        <!-- LEFT: MENU -->
        <div class="col-sm-2 col-xs-11 myMapleMenu" >
            <asp:Button runat="server" OnClick="MyTrips_Click" Text="My Trips" ID="btnTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="MyProfile_Click" Text="My Profile" ID="btnMyProfile" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="AccountSetting_Click" Text="Account Settings" ID="btnSetting" CssClass="btn btn-default btnMaple" /><br />
        </div>

        <!-- RIGHT: CONTENTS -->
        <div class="col-sm-9 col-xs-11 myMapleContents" >

            <iframe id="MyFrame" class="MainFrame" style="height: 600px;" src="" runat="server"></iframe>

        </div>

    </div>

</asp:Content>