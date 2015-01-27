window.onload = function(){
  window._bd_share_config = {share: []};

  $('*[data-tag^="share"]').each(
    function(){
      window._bd_share_config.share.push({
        tag: $(this).data('tag'),
        bdText: $(this).data('text'),
        bdUrl: $(this).data('url'),
        bdDesc: $(this).data('desc'),
        bdPic: $(this).data('pic')
      });
    }
  );

  with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
}