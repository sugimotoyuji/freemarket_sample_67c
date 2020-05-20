$(function() {

  $('form').submit(function() {
 
    if($('#search').val() == '') {
      alert('検索ワードが空欄です！');

      return false;
    }
  });
});