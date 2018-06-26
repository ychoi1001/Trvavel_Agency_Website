<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MapleLeaf2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <link rel="Stylesheet" href="./Styles/default.css" type="text/css" />
      <link href="https://fonts.googleapis.com/css?family=Oswald|Quicksand" rel="stylesheet">
        
  <div class="container">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="img/LogoSildes/whistler-village-canada.jpg" alt="whistler" style="width:100%;">
      </div>

      <div class="item">
        <img src="img/LogoSildes/banff.jpg" alt="banff" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="img/LogoSildes/winnipeg-skyline-canada.jpg" alt="winnipeg-skyline-canada" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


    <div class="row">
        <div class="two-col">
            <h2>&nbsp;&nbsp;Plan a Trip</h2>
            <ul>
             <li><a href="./TripInfo"><img class="tripInfo" runat="server" src="img/provinces/W-ontario.png" /></a></li>
             <li><a href="./TripInfo"><img class="tripInfo" runat="server" src="img/provinces/W-quebec.png" /></a></li>
             <li><a href="./TripInfo"><img class="tripInfo" runat="server" src="img/provinces/W-alberta.png" /></a></li>
             <li><a href="./TripInfo"><img class="tripInfo" runat="server" src="img/provinces/W-bc.png" /></a></li>
             <li><a href="./TripInfo"><img class="tripInfo" runat="server" src="img/provinces/W-pei.png" /></a></li>
            </ul>
        </div>

        <div class="two-col">
        <div class="card cardContainer" style="width:400px;height:150px;">
            <h2>Pick your journey</h2>
            <ul class="list-group list-group-flush">
                <li class="list-group-item cardHeader">Choose your Destination</li>
                <li class="list-group-item"><a href="./Trip/toronto.aspx">Toronto</a></li>
                <li class="list-group-item"><a href="./Trip/QuebecCity.aspx">Quebec City</a></li>
                <li class="list-group-item"><a href="./Trip/Vancouver.aspx">Vancouver</a></li>
                <li class="list-group-item"><a href="./Trip/Banff.aspx">Banff National Park</a></li>
                <li class="list-group-item"><a href="./Trip/Charlottetown.aspx">Charlottetown</a></li>
                <li class="list-group-item"><a href="./Trip/NiagaraFalls.aspx">NiagaraFalls</a></li>
            </ul> 
            <%--<p class="members">         
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            </p>
            <p class="members">
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            </p>--%>
            <asp:Button ID="Button1" class="memBtn" runat="server" Text="Learn More" />
        </div>
       </div>
    </div>

</asp:Content>
