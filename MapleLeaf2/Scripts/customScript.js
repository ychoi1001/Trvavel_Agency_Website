$(document).ready(function () {

    $("#btnImgSearch").click(function () {
        
        getJSONData();
    });

});

function getJSONData() {
    var flickrAPI = "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?";

    var imgSearch = $("#imgSearch").text();

    console.log(imgSearch);
    $.getJSON(flickrAPI, {
        tags: imgSearch,
        tagmode: "any",
        format: "json"
    },
        successFn);
}

function successFn(result) {
    $.each(result.items, function (i, item) {
        // insert img element and its attributes to #ajaxContent
        $("<img>").attr("src", item.media.m).appendTo("#ajaxContent");
        if (i === 8) { // to limit the number of images
            return false;
        }
    });
}

function errorFn(xhr, status, strErr) {
    alert(strErr);
}