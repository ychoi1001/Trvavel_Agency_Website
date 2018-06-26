<%@ Page Title="Quebec City" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QuebecCity.aspx.cs" Inherits="MapleLeaf2.Trip.QuebecCity" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link rel="Stylesheet" href="../Styles/toronto.css" type="text/css" />
     <link href="https://fonts.googleapis.com/css?family=Roboto+Slab|Saira+Condensed" rel="stylesheet">
   
    <h1 style="font-family:'Saira Condensed', sans-serif;">Quebec City Package Deal🍁</h1>

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
            <img src="../img/Quebec/quebec1.jpg" alt="Quebec City">
          </div>

          <div class="item">
            <img src="../img/Quebec/quebec2.jpg" alt="Quebec City">
          </div>
    
          <div class="item">
            <img src="../img/Quebec/quebec3.jpg" alt="Quebec City">
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
        <h2>Greater Quebec City Area</h2>
        <p>
            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui nesciunt. Quis autem voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.<br/>
            <%-- When clicking the link, integrate with google maps API and show 
            the location of toronto in the map --%>
            <span class="viewmap"><a class="openmodal" href="#showmap" data-toggle="modal">
                View a map</a> of this region.</span>
            </p>

        <div class="modal fade" id="showmap" role="dialog" >
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="back" >  
                    <div class="modal-header">
                    <h4>Quebec City</h4>
                    </div>
                <div class="modal-body">    
                    <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d414974.77121318673!2d-71.59831253552856!3d46.89921554139128!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4cb8968a05db8893%3A0x8fc52d63f0e83a03!2sQu%C3%A9bec+City%2C+QC!5e0!3m2!1sen!2sca!4v1520895262558" width="530" height="450"></iframe></div>
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
                    <img src="/img/Quebec/Attractions.png" alt="QuebecCity Attractions" width="950" height="400"/>
                </div>

                <h5>2. Accommodations</h5>
                 
                <div class="figureContainer">
                    <img src="/img/Quebec/Hotels.png" alt="QuebecCity Hotels" width="950" height="400"/>
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
                                 ＊PARC DE LA CHUTE-MONTMORENCY<br/>
                                 ＊OLD QUEBEC
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Hotel Le Concorde Quebec
                            </td>
                         </tr>

                          <tr>
                             <td class="left-td">Day2<br/><br/>
                                 <span class="highlight">
                                 ＊PLACE ROYALE<br/>
                                 ＊TERRASSE DUFFERIN
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Hotel Le Concorde Quebec
                            </td>
                         </tr>

                           <tr>
                             <td class="left-td">Day3<br/><br/>
                                 <span class="highlight">
                                 ＊LA CITADELLE DE QUEBEC
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Fairmont Le Chateau Frontenac
                            </td>
                         </tr>

                          <tr>
                             <td class="left-td">Day4<br/><br/>
                                 <span class="highlight">
                                 ＊LOWER TOWN (BASSE-VILLE)
                                 </span>
                             </td>
                             <td>** All You can Enjoy with AcrossMapleLeaf Tour **<br/> 
                                    1.	Morbi faucibus leo tempus<br/> 
                                    2.	Ligula molestie<br/> 
                                    3.	Et ornare est porttitor<br/><br/> 
                                      🏨Hotel: Fairmont Le Chateau Frontenac
                            </td>
                         </tr>
                         
                     </table>
                </div>
            </div>
        </div>
    



</div>


<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

 
<!-- Include Date Range Picker -->
<script type="text/javascript" src="../Scripts/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />




    


<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-datetimepicker-standalone.css">
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>

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
