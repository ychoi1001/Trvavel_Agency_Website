<%@ Page Title="Trip List" Language="C#" AutoEventWireup="true" CodeBehind="TripList.aspx.cs" Inherits="MapleLeaf2.PersonalPage.TripList" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trip List</title>
    <link href="../Styles/myMaple.css" rel="stylesheet" />
</head>
<body>
    <h3>Trip List</h3>

    <asp:Table ID="tripTable" runat="server" Width="100%"> 
        <asp:TableRow>
            <asp:TableCell>Where to go</asp:TableCell>
            <asp:TableCell>Start date </asp:TableCell>
            <asp:TableCell>End date </asp:TableCell>
        </asp:TableRow>
    </asp:Table> 

    <asp:Label ID="Erro" runat="server" Text=""></asp:Label>
</body>
</html>