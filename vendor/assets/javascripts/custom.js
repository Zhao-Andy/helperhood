$(document).ready(function () {
    'use strict';
    /*----------- Preloader -----------*/
    jQuery(window).load(function () {
        jQuery('.pulse').fadeOut();
        jQuery('.preloader').delay(1000).fadeOut('slow');
    });
    $(window).resize(function () {
        $(".navbar-collapse").css({maxHeight: $(window).height() - $(".navbar-header").height() + "px"});
    });
    //sticky navbar
    $(".navbar-sticky").sticky({topSpacing: 0});
    //menu on hover
    $('.js-activated').dropdownHover({
        instantlyCloseOthers: false,
        delay: 0
    }).dropdown();

    //owl arrows slider
    $(".owl-arrows-slider").owlCarousel({
        autoPlay: 5000, //Set AutoPlay to 3 seconds
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [979, 3],
        pagination: false,
        navigation: true,
        navigationText: ["<i class='fa fa-angle-double-left'></i>", "<i class='fa fa-angle-double-right'></i>"]
    });
    $('.counter-digit').counterUp({
        delay: 10,
        time: 5000
    });
});