var lastScroll = 0;

window.onscroll = function(){
  if( $(window).width() <= 767) {

    var navigatorBar = $('.navbar-default');
    var st = $(this).scrollTop();
    var scrollDown = (st > lastScroll);

    if( scrollDown && window.pageYOffset >= 100 ) {
      $(navigatorBar).css('top','-50px');
    }
    if(!scrollDown ) {
      $(navigatorBar).css('top','0px');
    }

    lastScroll = st;
  }
}