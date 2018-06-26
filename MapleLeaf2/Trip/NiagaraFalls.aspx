<%@ Page Title="NiagaraFalls" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NiagaraFalls.aspx.cs" Inherits="MapleLeaf2.Trip.NiagaraFalls" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link rel="Stylesheet" href="./Styles/toronto.css" type="text/css" />

     <h2>NiagaraFalls Package Deal</h2>

    <div class="datepicker">
       
        <div class="innerDatepicker">
            <h4>Pick your Date and Time</h4>

         <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
            <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
            <span></span> <b class="caret"></b>
        </div>
            <br />
            <br />
            <br />
            <br />
            <%-- Display the message when the submit button is clicked --%>
            <asp:Button ID="bookingButton" runat="server" Text="Book Now" OnClick="SaveBooking" CssClass="booking" />
            <asp:TextBox ID="bookingDate" runat="server"></asp:TextBox>
            
            <%-- For testing--%>
            <asp:Label ID="bookingErro" runat="server"  Visible="True" Text=""></asp:Label>
            
        </div>

    </div>

    <script type="text/javascript">
    var bookingDate ="#<%=bookingDate.ClientID%>"
    $('#reportrange').daterangepicker({
        "ranges": {
            "DATE 1": [
                "03/18/2018",
                "03/21/2018"
            ],
            "DATE 2": [
                "03/25/2018",
                "03/28/2018"
            ],
            "DATE 3": [
                "04/02/2018",
                "04/05/2018"
            ]
        },
        "showCustomRangeLabel": false,
        "alwaysShowCalendars": true,
        "startDate": "03/13/2018",
        "endDate": "04/19/2018"
    }, function (start, end) {
        $('#reportrange span').html(start.format('YYYY-MM-DD') + ' To ' + end.format('YYYY-MM-DD'));
        $(bookingDate).val(start.format('YYYY-MM-DD') + ' To ' + end.format('YYYY-MM-DD'));
        });

</script>

</asp:Content>
