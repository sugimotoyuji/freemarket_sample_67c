$(function(){
  $(".inner__top__searchBox__fom").submit(function(){
    if($("#search").val() == ""){
      alert("検索項目が空欄です！");
      return false;
    }
  });
});