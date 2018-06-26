<%@ Page Title="Account Setting" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountSetting.aspx.cs" Inherits="MapleLeaf2.PersonalPage.AccountSetting" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to delete your account?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>


    <h3>My Maple</h3>

    <div class="row">
        <div class="col-sm-2 col-xs-11 myMapleMenu" >
                <asp:Button runat="server" OnClick="MyTrips_Click" Text="My Trips" ID="btnTrip" CssClass="btn btn-default btnMaple" /><br />
                <asp:Button runat="server" OnClick="MyProfile_Click" Text="My Profile" ID="btnMyProfile" CssClass="btn btn-default btnMaple" /><br />
                <asp:Button runat="server" OnClick="AccountSetting_Click" Text="Account Settings" ID="btnSetting" CssClass="btn btn-default btnMaple" /><br />
         </div>

        <div class="col-sm-9 col-xs-11 myMapleContents" >
        <iframe id="MyFrame" class="MainFrame" style="height: 600px; width: 800px;" src="" runat="server" visible="false"></iframe>
        <h4>Change your account settings</h4>
        <asp:PlaceHolder runat="server" ID="ErrorLoginPlz" Visible="false">
            <p class="text-danger">
            <asp:Literal runat="server" ID="FailureText" />
            </p>
        </asp:PlaceHolder>

        <div>
            <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                <p class="text-success"><%: SuccessMessage %></p>
            </asp:PlaceHolder>
        </div>

        <asp:PlaceHolder runat="server" ID="ResetAccount" Visible="false">
        <div class="row">
            <div class="col-md-12">
                <div class="form-horizontal">
                    <p>Email: <asp:Literal runat="server" ID="UserName" /></p>
                    <p>Password:
                        <asp:HyperLink NavigateUrl="./ManageAccount" Text="[Change]" Visible="false" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="./ManageAccount" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </p>
                    <asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="<input type='button' onclick='Confirm();' value='Delete Your Account' />" LogoutPageUrl="~/LogoutPage" OnLoggingOut="Unnamed_LoggingOut"/>
                    <asp:Literal runat="server" ID="Erro" />
                
                </div>
            </div>
        </div>
        </asp:PlaceHolder>
        </div>

    </div>

    </asp:Content>
