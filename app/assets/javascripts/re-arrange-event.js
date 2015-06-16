$(function(){
    if( $(window).width() <= 767) {
      $('#sign-up-from').insertAfter($('.default-content'));

      $('.sign-up-tab a').click(displaySignUpContainer);
      $('.close-icon').click(removeSignUpContainer);
    }
  }
);

window.onresize = function() {
  if( $(window).width() <= 767) {
    $('#sign-up-from').insertAfter($('.default-content'));

    $('.sign-up-tab a').click(displaySignUpContainer);
    $('.close-icon').click(removeSignUpContainer);
  } else {
    $('#sign-up-from').insertAfter($('.right-box .event-detail'));
  }
};

function displaySignUpContainer() {
  $('.cover').show();
  $('.sign-up-container').css({ "display": "block", top: $(window).height() }).animate({ top: 409 }, 300);
}

function removeSignUpContainer() {
  $('.cover').hide();
  $('.sign-up-container').css({ "display": "none", top: 409 }).animate({ top: $(window).height() }, 300);
}