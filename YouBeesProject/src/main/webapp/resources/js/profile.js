$(function () {
    $(".detail_rev_btn").click(function () {
        $(".detail_revise").toggleClass("hidden");
        $(".detail").toggleClass("hidden");
    });

    $(".contect_btn").click(function () {
        $(".contect_revise").toggleClass("hidden");
        $(".contect_time").toggleClass("hidden");
    })

    $(".career_btn").click(function () {
        $(".career_revise").toggleClass("hidden");
        $(".career").toggleClass("hidden");
    })

});

function wrapWindowByMask() {

    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({ "width": maskWidth, "height": maskHeight });

    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    $("#mask").fadeIn(0);
    $("#mask").fadeTo("slow", 0.6);

    //윈도우 같은 거 띄운다.
    $(".window").fadeIn();

}

$(document).ready(function () {
    //검은 막 띄우기
    $(".openMask").click(function (e) {
        e.preventDefault();
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $(".window .close").click(function (e) {
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();
        $("#mask, .window").hide();
    });

    //검은 막을 눌렀을 때
    $("#mask").click(function () {
        $(this).hide();
        $(".window").hide();

    });

});