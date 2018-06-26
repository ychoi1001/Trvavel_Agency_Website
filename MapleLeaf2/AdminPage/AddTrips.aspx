<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AddTrips.aspx.cs" Inherits="MapleLeaf2.AdminPage.AddTrips" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <link href="https://fonts.googleapis.com/css?family=Quicksand|Oswald" rel="stylesheet">
    <link rel="Stylesheet" href="../Styles/admin.css" type="text/css" />


     <h3>Admin Page</h3>
    
    <!-- PAGE CONTENTS-->
    <div class="row">

        <!-- LEFT: MENU -->
        <div class="col-sm-2 col-xs-11 myMapleMenu" >
            <asp:Button runat="server" OnClick="TripLists_Click"  Text="Trip List" ID="btnTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="ModifyTrip_Click" Text="Add Trip" ID="btnModifyTrip" CssClass="btn btn-default btnMaple" /><br />
            <asp:Button runat="server" OnClick="AdminAccount_Click" Text="Account Settings" ID="btnSetting" CssClass="btn btn-default btnMaple" /><br />
        </div>
    
        <h3>Add Trip</h3>
        
        <asp:Label ID="LabelCity" runat="server" Text="Where to go?"></asp:Label>
        <asp:DropDownList ID="City" runat="server">
            <asp:ListItem value="Banff" >
              Banff
             </asp:ListItem>
            <asp:ListItem value="Charlottetown" >
              Charlottetown
             </asp:ListItem>
            <asp:ListItem value="NiagaraFalls" >
              Niagara Falls
             </asp:ListItem>
            <asp:ListItem value="QuebecCity" >
              Quebec City
             </asp:ListItem>
            <asp:ListItem value="Toronto" >
              Toronto
             </asp:ListItem>
            <asp:ListItem value="Vancouver" >
              Vancouver
             </asp:ListItem>
        </asp:DropDownList></br>
        
        <asp:Label ID="example" runat="server" Text="Enter date like this ex.(2018-04-25)"></asp:Label></br>

        <asp:Label ID="LabelStartDate" runat="server" Text="Start date"></asp:Label>
        <asp:TextBox ID="StartDate" runat="server"></asp:TextBox></br>

        <asp:Label ID="LabelEndDate" runat="server" Text="End date"></asp:Label>
        <asp:TextBox ID="EndDdate" runat="server"></asp:TextBox></br>

        <asp:Label ID="LabelMaximum" runat="server" Text="Maximum members"></asp:Label>
        <asp:TextBox ID="Maximum" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" OnClick="AddTrip_Click" runat="server" Text="Button" /></br></br>

        


    <asp:Label ID="Erro" runat="server" Text=""></asp:Label>


        </div>
        </asp:Content>
