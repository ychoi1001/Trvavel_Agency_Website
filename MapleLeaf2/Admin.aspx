<%@ Page Title="MyMaple" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="MapleLeaf2.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- TOP: PAGE HEADING -->
    <h3>Admin Page</h3>
    
    <!-- PAGE CONTENTS-->
    <div class="row">

        <!-- LEFT: MENU -->
        <div class="col-sm-2 col-xs-11 myMapleMenu" >
            <asp:Button runat="server" OnClick="TripLists_Click" Text="Trip List" ID="btnTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="ModifyTrip_Click" Text="Add Trip" ID="btnModifyTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="AdminAccount_Click" Text="Admin Account Settings" ID="btnSetting" CssClass="btn btn-default btnMaple" /><br />
        </div>

        <!-- RIGHT: CONTENTS -->
        <div class="col-sm-9 col-xs-11 myMapleContents" >
            <h2>This is Admin Page!</h2>
            <iframe id="MyFrame" class="MainFrame" style="height: 600px;" src="" runat="server" visible="false"></iframe>

        </div>

    </div>

</asp:Content>