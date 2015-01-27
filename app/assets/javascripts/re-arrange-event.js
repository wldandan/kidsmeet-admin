$(function(){
    if( $(window).width() <= 767) {
      $('.activity-intro .intro').insertAfter($('#sign-up-from'));
    }
  }
);

window.onresize = function() {
  if( $(window).width() <= 767) {
    $('.activity-intro .intro').insertAfter($('#sign-up-from'));
  } else {
    $('.right-box .intro').insertAfter($('.gallery'));
  }
};