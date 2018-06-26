<%@ Page Title="Charlottetown" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Charlottetown.aspx.cs" Inherits="MapleLeaf2.Trip.Charlottetown" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link rel="Stylesheet" href="../Styles/toronto.css" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Saira+Condensed" rel="stylesheet">

        <h1>Charlottetown Package Deal🍁</h1>
   
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
            <img src="../img/Charlottetown/charlottetown2.jpg" alt="charlottetown">
          </div>

          <div class="item">
            <img src="../img/Charlottetown/charlottetown1.jpg" alt="charlottetown">
          </div>
    
          <div class="item">
            <img src="../img/Charlottetown/charlottetown3.jpg" alt="charlottetown">
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
        <h2>Want to travel to Charlottetown?</h2>
        <p>
            The picturesque and pastoral setting for Lucy Maud Montgomery's series of books, Anne of Green Gables, the island of PEI is one of the most soothing and graceful destinations in all of Canada. Its capital, Charlottetown, has the small town appeal of quiet streets for strolling, plenty of greenery and a well-preserved historical core, which incidentally was the site of the famous 1864 conference which lead to the creation of Canada.<br/>
            <%-- When clicking the link, integrate with google maps API and show 
            the location of Charlottetown in the map --%>
            <span class="viewmap"><a class="openmodal" href="#showmap" data-toggle="modal">
                View a map</a> of this region.</span>
        </p>

        <div class="modal fade" id="showmap" role="dialog" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="back" >  
                    <div class="modal-header">
                    <h4>Charlottetown</h4>
                    </div>
                <div class="modal-body">    
                    <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d88268.95453183595!2d-63.205930403307434!3d46.262058500127786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4b5e52ddd47f83c5%3A0x5a5777b89f519b27!2sCharlottetown%2C+PE!5e0!3m2!1sen!2sca!4v1521357418874" width="530" height="450"></iframe></div>
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
                    <img src="/img/Charlottetown/Attractions-ch.jpg" alt="Charlottetown Attractions" width="950" height="400"/>
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
                    <img src="/img/Charlottetown/Hotels-ch.jpg" alt="Charlottetown Hotels" width="950" height="400"/>
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
                                 ＊POINT PRIM LIGHTHOUSE<br/>
                                 ＊ORWELL CORNER HISTORIC VILLAGE
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: The Sonata Inn
                            </td>
                         </tr>

                          <tr>
                             <td class="left-td">Day2<br/><br/>
                                 <span class="highlight">
                                 ＊GREEN GABLES
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: The Sonata Inn
                            </td>
                         </tr>

                           <tr>
                             <td class="left-td">Day3<br/><br/>
                                 <span class="highlight">
                                 ＊CABOT BEACH PROVINCIAL PARK
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Rodd Charlottetown
                            </td>
                         </tr>

                          <tr>
                             <td class="left-td">Day4<br/><br/>
                                 <span class="highlight">
                                 ＊GOVERNMENT HOUSE<br />
                                 ＊JOST VINEYARDS
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Rodd Charlottetown
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