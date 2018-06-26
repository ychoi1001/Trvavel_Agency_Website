<%@ Page Title="Banff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Banff.aspx.cs" Inherits="MapleLeaf2.Trip.Banff" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link rel="Stylesheet" href="../Styles/toronto.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Saira+Condensed" rel="stylesheet">

    <h1>Banff National Park Package Deal🍁</h1>
   
    <div class="container-all">
      <div id="container">
        <div id="myCarousel" class="carousel slide slideContainer" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner innerSlide">
          <div class="item active">
            <img src="../img/Banff/banff1.jpg" alt="banff national park">
          </div>

          <div class="item">
            <img src="../img/Banff/banff2.jpg" alt="banff national park">
          </div>
    
          <div class="item">
            <img src="../img/Banff/banff3.jpg" alt="banff national park">
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

    <div class="right-container">
        <h2>Banff National Park Camping</h2>
        <p>
            Camping in one of Banff National Park’s campgrounds provides visitors with an opportunity to enjoy Alberta, Canada’s Rocky Mountain world renowned scenery and prolific wildlife from the comfort of their own RV. The hustle and bustle of the Banff townsite can be left behind by settling into one of the area’s many campgrounds, allowing you to enjoy the park’s animals, scenery and of course the company of visitors from all over the world that share your interest in camping in the great outdoors. <br/>
            <%-- When clicking the link, integrate with google maps API and show 
            the location of Banff National Park in the map --%>
            <span class="viewmap"><a class="openmodal" href="#showmap" data-toggle="modal">
                View a map</a> of this region.</span>
        </p>

        <div class="modal fade" id="showmap" role="dialog" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="back" >  
                    <div class="modal-header">
                    <h4>Banff National Park</h4>
                    </div>
                <div class="modal-body">    
                    <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2483.8921619206103!2d-115.93024488423038!3d51.4968463796334!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5377662b8c929195%3A0xc09de268accad7e6!2sBanff+National+Park!5e0!3m2!1sen!2sca!4v1521355045120" width="530" height="450"></iframe></div>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-default" data-dismiss="modal">Close</a>
                </div>      
                </div>
            </div>
          </div>
    </div>


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




        <div class="tripDetails">
            <div class="innerDetails">
                <h4>Trip Details🚀</h4>

                <h5>1. Key Attractions</h5>

                <div class="figureContainer">
                    <img src="/img/Banff/Attractions_banff.jpg" alt="Banff National Park Attractions" width="950" height="400"/>
                </div>

               <%-- <ul>
                    <li>TORONTO ISLANDS & CENTREVILLE</li>
                    <li>ST. LAWRENCE MARKET</li>
                    <li>CN TOWER & EDGEWALK</li>
                    <li>RIPLEY’S AQUARIUM OF CANADA</li>
                    <li>THE DISTILLERY HISTORIC DISTRICT</li>
                    <li>CASA LOMA</li>
                </ul>--%>

                <h5>2. Accommodations</h5>
                 
                <div class="figureContainer">
                    <img src="/img/Banff/Hotels-banff.jpg" alt="Banff National Park Hotels" width="950" height="400"/>
                </div>

                <h5>3. Program Schedule</h5>
                 <div class="figureContainer">
                     <table class="table">
                         <tr>
                             <th>Place</th>
                             <th>Detailed Information</th>
                         </tr>
                         <tr>
                             <td class="left-td">Day1<br/><br/>
                                 <span class="highlight">
                                 ＊WILLOCK & SAX GALLERY<br/>
                                 ＊CAVE AND BASIN NATIONAL HISTORIC SITE
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Fairmont Chateau Lake Louise
                            </td>
                         </tr>

                          <tr>
                             <td class="left-td">Day2<br/><br/>
                                 <span class="highlight">
                                 ＊SUNSHINE VILLAGE<br/>
                                 ＊BUFFALO NATIONS LUXTON MUSEUM
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Fairmont Chateau Lake Louise
                            </td>
                         </tr>

                           <tr>
                             <td class="left-td">Day3<br/><br/>
                                 <span class="highlight">
                                 ＊WHYTE MUSEUM OF THE CANADIAN ROCKIES
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Lake Louise Inn
                            </td>
                         </tr>

                          <tr>
                             <td class="left-td">Day4<br/><br/>
                                 <span class="highlight">
                                 ＊THE LAKE LOUISE SKI RESORT
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Lake Louise Inn
                            </td>
                         </tr>
                         
                     </table>
                </div>
            </div>
        </div>

</div>
    <!-- Include Date Range Picker -->
<script type="text/javascript" src="../Scripts/daterangepicker.js"></script>

    <script type="text/javascript">
    
        var JavascriptBlah = '<%=json%>';
        var obj = JSON.parse(JavascriptBlah);
        (function () {
            console.log(obj);
           
        })();
     //   alert(JavascriptBlah);
    var bookingDate ="#<%=bookingDate.ClientID%>"
    $('#reportrange').daterangepicker({
        "ranges":obj ,
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
