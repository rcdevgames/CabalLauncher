$().ready(
    function() {
        var cnt = 0;
        $("img.cmdRollover").each(
            function(e) {
                if ($(this).attr("id") === '' || $(this).attr("id") == null) {
                    $(this).attr("id", "CLImageRollover" + cnt);
                    cnt++;
                }
                var currentElement = $(this);
                $(this).wrap("<span id='" + $(this).attr("id") + "container'></span>")
                    .after('<img src="' + $(this).attr("src").replace("off", "on") + '" id="On_' + $(this).attr("id") + '" style="display:none;" />');
                $("#" + $(this).attr("id") + "container").hover(
                    function() {
                        currentElement.css("display", "none");
                        $("#On_" + currentElement.attr("id") ).css("display", "");
                    },
                    function() {
                        currentElement.css("display", "");
                        $("#On_" + currentElement.attr("id") ).css("display", "none");
                    }
                );
            }
        );
    }
);

    var FixImage =
{
    SetImageFix: function(masterid, id) {
        $("[id^=" + masterid + "]").each(function(i) {
            if ($(this).attr("src") != null) {
                $(this).attr("src", $(this).attr("src").replace("on", "off"));
            }
        });
        $("#" + masterid + id).attr("src", $("#" + masterid + id).attr("src").replace("off", "on"));

    }

}
var PanelControl =
{
    SetPanelVisible: function(masterid, id) {
        $("[id^=" + masterid + "]").each(function(i) {
            $(this).css("display", "none");
        });
        $("#" + masterid + id).css("display", "");
    }
}