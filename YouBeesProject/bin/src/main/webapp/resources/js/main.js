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
    slidesPerView: 5,
    spaceBetween: 10,
    centeredSlides: true,
    pagination: {
        el: '.swiper-pagination',
        clickable: true
    },
    navigation: {
        prevEl: '.swiper-button-prev',
        nextEl: '.swiper-button-next'
    }
})