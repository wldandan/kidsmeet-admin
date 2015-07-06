$(function(){
    $('.activity-list').infinitescroll({
      behavior: 'local',
      navSelector: $('nav .pager'),
      nextSelector: $('nav .pager a[rel=next]'),
      itemSelector: '.activity'
    },
    function( newElements ) {
      var $newElems = $( newElements );
      $('.masonry-container').masonry( 'appended', $newElems, true );
    }
    );
  }
);
