<%@ Page Title="Admin Trip List" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminTripList.aspx.cs" Inherits="MapleLeaf2.AdminPage.AdminTripList" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link href="https://fonts.googleapis.com/css?family=Quicksand|Oswald" rel="stylesheet">
     <link rel="Stylesheet" href="../Styles/admin.css" type="text/css" />

    <h3>Admin Page</h3>
    
    <!-- PAGE CONTENTS-->
    <div class="row">

        <!-- LEFT: MENU -->
        <div class="col-sm-2 col-xs-11 myMapleMenu" >
            <asp:Button runat="server" Text="Trip List" ID="btnTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="ModifyTrip_Click" Text="Add Trip" ID="btnModifyTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="AdminAccount_Click" Text="Account Settings" ID="btnSetting" CssClass="btn btn-default btnMaple" /><br />
        </div>

        <!-- RIGHT: CONTENTS -->
        <div class="col-sm-9 col-xs-11 myMapleContents" >
            <h3>Trip List</h3>

            <asp:Table ID="tripTable" runat="server" Width="100%" CssClass="Tables"> 
                <asp:TableRow>
                    <asp:TableCell>Where to go</asp:TableCell>
                    <asp:TableCell>Start date </asp:TableCell>
                    <asp:TableCell>End date </asp:TableCell>
                </asp:TableRow>
            </asp:Table> 

            <asp:Label ID="Erro" runat="server" Text=""></asp:Label>
            <iframe id="MyFrame2" class="MainFrame" style="height: 600px;" src="" runat="server" visible="false"></iframe>

        </div>

    </div>

</asp:Content>
