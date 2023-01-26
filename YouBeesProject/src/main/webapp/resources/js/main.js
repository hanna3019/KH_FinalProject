$(function () {

    // 이미지 왼쪽으로 슬라이드
    setInterval(slide, 3000);
    let x = $("#imgslide>img");
    let y = 3;
    function slide() {
        y--;
        if (y == 0) {
            x.fadeIn();
            y = 3;
        } else {
            x.eq(y).fadeOut();
        }
    }

})

new Swiper('.swiper', {
    loop: true,
    loopAdditionalSlides : 1,
    slidesPerView: 5,
    spaceBetween: 30,
    loopFillGroupWithBlank : true,
    centeredSlides: true,
    initialSlide: 2,
    pagination: {
        el: '.swiper-pagination',
        clickable: true
    },
    navigation: {
        prevEl: '.swiper-button-prev',
        nextEl: '.swiper-button-next',
    }
})