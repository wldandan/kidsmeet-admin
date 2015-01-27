/**
 * Created by twer on 12/27/14.
 */
$(function(){
    $('.activity-list').infinitescroll({
      behavior: 'local',
      navSelector: $('nav .pager'),
      nextSelector: $('nav .pager a[rel=next]'),
      itemSelector: '.activity'
    });
  }
);
