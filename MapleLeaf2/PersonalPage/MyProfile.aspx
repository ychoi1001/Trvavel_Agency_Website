<%@ Page Title="My Profile" Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="MapleLeaf2.PersonalPage.MyProfile" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>
    <link href="../Styles/myMaple.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h4>My Profile</h4>
        <asp:PlaceHolder runat="server" ID="ErrorLoginPlz" Visible="false">
            <p class="text-danger">
            <asp:Literal runat="server" ID="FailureText" />
            </p>
        </asp:PlaceHolder>

        <div>
            <asp:Panel ID="Panel1" CssClass="Panels" runat="server" Visible="false" Height="250px" style="top: 10px;">
            
            <asp:Label ID="Email" CssClass="Labels" style="top: 75px; left: 30px; height: 17px;" runat="server" Text="Email Address"></asp:Label>
            <asp:TextBox ID="txtEmail" CssClass="TextBoxes" style="top: 75px; left: 150px; width: 160px;" runat="server"></asp:TextBox>
            <%--<asp:Label runat="server" ID="UserName" CssClass="Labels" style="top: 75px; left: 120px; width: 160px;" />--%>

            <br />

            <asp:Label ID="NickName" style="left: 30px; top: 110px;" CssClass="Labels" runat="server" Text="Nick Name"></asp:Label>
            <asp:TextBox ID="txtNickName" style="top: 110px; left: 150px; width: 160px;" CssClass="TextBoxes" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNick" runat="server"
                    ErrorMessage="Please enter nick name"
                    ControlToValidate="txtNickName"
                    EnableClientScript="False"
                    ValidateRequestMode="Disabled"
                    CssClass="Validdation"
                    style="left: 320px; top: 110px;"
                    ValidationGroup="myGroup">
                </asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="lblCity" CssClass="Labels" style="left: 30px; top: 145px; width: 25px;" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity" CssClass="TextBoxes" style="left: 150px; top: 145px; width: 160px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                    ErrorMessage="Please enter your city"
                    ControlToValidate="txtCity"
                    EnableClientScript="False"
                    ValidateRequestMode="Disabled"
                    CssClass="Validdation"
                    style="left: 320px; top: 144px;"
                    ValidationGroup="myGroup">
                </asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="lblProvince" CssClass="Labels" style="left: 30px; top: 180px" runat="server" Text="Province"></asp:Label>
            <asp:TextBox ID="txtProvince" CssClass="TextBoxes" style="left: 150px; top: 180px; width: 160px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvProvince" runat="server"
                    ErrorMessage="Please enter your province"
                    ControlToValidate="txtProvince"
                    EnableClientScript="False"
                    ValidateRequestMode="Disabled"
                    CssClass="Validdation"
                    style="left: 320px; top: 178px;"
                    ValidationGroup="myGroup">
                </asp:RequiredFieldValidator>
            <br />

            <asp:Label ID="lblPostal" CssClass="Labels" style="left: 30px; top: 215px; margin-bottom: 18px;" runat="server" Text="Postal"></asp:Label>
            <asp:TextBox ID="txtPostal" CssClass="TextBoxes" style="left: 150px; top: 215px; width: 160px" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revPostal" runat="server"
                    ErrorMessage="Please check your postal code"
                    ControlToValidate="txtPostal"
                    EnableClientScript="False"
                    ValidateRequestMode="Disabled"
                    CssClass="Validdation"
                    style="left: 320px; top: 215px;"
                    ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]"
                    ValidationGroup="myGroup">
                </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvPostal" runat="server"
                    ErrorMessage="Please enter your postal code"
                    ControlToValidate="txtPostal"
                    EnableClientScript="False"
                    ValidateRequestMode="Disabled"
                    CssClass="Validdation"
                    style="left: 320px; top: 215px;"
                    ValidationGroup="myGroup">
                </asp:RequiredFieldValidator>
            <br /><br />

            <br />

            </asp:Panel> <!--panel1 for edit-->

            <!--initPanel for display current profile-->
            <asp:Panel ID="initPanel" CssClass="Panels" runat="server" Visible="false" Height="250px" style="top: 10px;">
                <asp:Label ID="Email2" CssClass="Labels" style="top: 75px; left: 30px; height: 17px;" runat="server" Text="Email Address"></asp:Label>
                <asp:Label ID="UserName2" CssClass="Labels" style="top: 75px; left: 150px; width: 160px;" runat="server"/>
            
                <asp:Label ID="initNick" style="left: 30px; top: 110px;" CssClass="Labels" runat="server" Text="Nick Name"></asp:Label>
                <asp:Label ID="initNickLbl" CssClass="Labels" style="top: 110px; left: 150px; width: 160px;" runat="server"></asp:Label>

                <asp:Label ID="initCity" CssClass="Labels" style="left: 30px; top: 145px; width: 25px;" runat="server" Text="City"></asp:Label>
                <asp:Label ID="initCityLbl" CssClass="Labels" style="left: 150px; top: 145px; width: 160px" runat="server"></asp:Label>
              
                <asp:Label ID="initProv" CssClass="Labels" style="left: 30px; top: 180px" runat="server" Text="Province"></asp:Label>
                <asp:Label ID="initProvLbl" CssClass="Labels" style="left: 150px; top: 180px; width: 160px" runat="server"></asp:Label>

                <asp:Label ID="initPostal" CssClass="Labels" style="left: 30px; top: 215px; margin-bottom: 18px;" runat="server" Text="Postal"></asp:Label>
                <asp:Label ID="initPostalLbl" CssClass="Labels" style="left: 150px; top: 215px; width: 160px" runat="server"></asp:Label>
                
                <asp:Label ID="lblMessages" runat="server" CssClass="Messages" style="left:30px; top:265px; right:10px; height:16px;" Visible="true" Text=""></asp:Label>
            </asp:Panel>

            <asp:Button ID="btnUpdateCustomer" CssClass="btn btn-outline-primary" style="position:relative; width: 108px; padding:5px; margin: 10px; margin-left:0; background-color:yellow;" runat="server" Text="Update" ToolTip="Create a new customer" Visible="true" OnClick="btnUpdateCustomer_Click"  />
            <asp:Button ID="btnSave" CssClass="btn btn-outline-primary" style="position:relative; width: 108px; padding:5px; margin: 10px; margin-left:0; background-color:yellow;" runat="server" Text="Save" Visible="false" OnClick="btnSave_Click"  />

        </div>
    </form>
</body>
</html>