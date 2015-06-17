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
  $('.sign-up-container').css({ "display": "block", top: $(window).height() }).animate({ top: $(window).height() - $('#sign-up-from .panel-content').outerHeight() }, 300);
}

function removeSignUpContainer() {
  $('.cover').hide();
  $('.sign-up-container').hide();
}