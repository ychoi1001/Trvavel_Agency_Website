<%@ Page Title="Community" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Community.aspx.cs" Inherits="MapleLeaf2.Community" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
    <link rel="Stylesheet" href="./Styles/community.css" type="text/css" />

    <%-- JH: Custom JavaScript for image search (Community page) --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="Scripts/customScript.js"></script>

    <div class="row-container row">
        <div class="col-sm-7 col-xs-11" id="imageSearch">
            
        <div class="input-group mb-3">
            <div class="input-group-prepend">
            <h2><span class="input-group-text" id="imgSearchTxt">Image Search by Location</span></h2>
            </div>
            <input type="text" id="imgSearchBox">
            <div class="input-group-append">
            <button class="btn btn-warning" type="button" id="btnImgSearch">Search</button>
            </div>
        </div>
        <div id="ajaxContent"></div>
        </div>

        <div class="col-sm-4 col-xs-11">
            <h3 id="h2_2">Get latest blog updates from <span style="color:darkred; font-weight:bold;">Expert Vagabond</span></h3>
            <%--RSS FEED from https://expertvagabond.com--%>
            <div id="rss-feed">
            <!-- start sw-rss-feed code --> 
            <script type="text/javascript"> 
            rssfeed_url = new Array(); 
            rssfeed_url[0]="http://expertvagabond.com/feed/";  
            rssfeed_frame_width="350"; 
            rssfeed_frame_height="500"; 
            rssfeed_scroll="on"; 
            rssfeed_scroll_step="6"; 
            rssfeed_scroll_bar="off"; 
            rssfeed_target="_blank"; 
            rssfeed_font_size="15"; 
            rssfeed_font_face =""; 
            rssfeed_border = "on";
            rssfeed_css_url =""; 
            rssfeed_title="on"; 
            rssfeed_title_name=""; 
            rssfeed_title_bgcolor="#3366ff"; 
            rssfeed_title_color="#fff"; 
            rssfeed_title_bgimage=""; 
            rssfeed_footer="off"; 
            rssfeed_footer_name="rss feed"; 
            rssfeed_footer_bgcolor="#fff"; 
            rssfeed_footer_color="#333"; 
            rssfeed_footer_bgimage=""; 
            rssfeed_item_title_length="50"; 
            rssfeed_item_title_color="#666"; 
            rssfeed_item_bgcolor="#fff"; 
            rssfeed_item_bgimage=""; 
            rssfeed_item_border_bottom="on"; 
            rssfeed_item_source_icon="off"; 
            rssfeed_item_date="off"; 
            rssfeed_item_description="on"; 
            rssfeed_item_description_length="120"; 
            rssfeed_item_description_color="#666"; 
            rssfeed_item_description_link_color="#333"; 
            rssfeed_item_description_tag="off"; 
            rssfeed_no_items="0"; 
            rssfeed_cache = "df6be1b8d02aeb55e0ba8f7e6b5f15f5"; 
            </script> 
            </div>
            <script type="text/javascript" src="//feed.surfing-waves.com/js/rss-feed.js"></script> 
            <!-- The link below helps keep this service FREE, and helps other people find the SW widget. Please be cool and keep it! Thanks. --> 
            <div style="text-align:right; width:300px;">powered by <a href="http://www.surfing-waves.com" rel="noopener" target="_blank" style="color:#ccc;font-size:10px">Surfing Waves</a></div> 
            <!-- end sw-rss-feed code -->
        </div> <!-- END RSS FEED-->

    </div>

    </div>
</asp:Content>