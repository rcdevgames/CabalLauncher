




var EventBannerHandler =
{
    itemMaxCount: 0, //모든 아이템 숫자
    itemStatus: 0,
    beforeStatus: 0,
    isOver: false,
    isMoving: true, 
    SetCurrentBanner: function(no) {
        this.itemStatus = no;
        this.SetSignal(this.itemStatus);
        this.FadeinBanner(this.itemStatus, this.beforeStatus);
        this.beforeStatus = this.itemStatus; //과거의 것을 갱신시켜줌
    },

    FadeinBanner: function(after, before) {
        $("[id^=eventBanner]").each(
            function(i) {
                if (after == i) {
                    $(this).css("z-index", "10").css("display", "none").fadeIn(500);
                }
                else if (before == i) {
                    $(this).css("z-index", "9").css("display", "").fadeIn(1);
                }
                else {
                    $(this).css("z-index", "1").css("display", "").fadeIn(1);
                }
                $(this).hover(function() { this.isOver = true; }, function() { this.isOver = false; });
            }
        );

    },

    SetSignal: function(no) {
        $("[id^=eventBtnOn]").each(
            function(i) {
                if (no == i) {
                    $(this).css("display", "");
                }
                else {
                    $(this).css("display", "none");
                }
            }
        );
        $("[id^=eventBtnOff]").each(
            function(i) {
                if (no == i) {
                    $(this).css("display", "none");
                }
                else {
                    $(this).css("display", "");
                }
            }
        );
    }    
}