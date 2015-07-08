window.onload = function() {
  $('.masonry-container').masonry({
    itemSelector : '.graph-container',
    isAnimated: true,
    animationOptions: {
      duration: 500,
      easing: 'linear',
      queue: false
    }
  });
}
