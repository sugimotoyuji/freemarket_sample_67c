$(function(){
  $('.sell-main__sell-form__submit__form').on('click',function() {
   let isEmpty = false;
   jQuery('.js-file,').each(function(){
    if(jQuery(this).val() === ''){
     alert("画像が入力されていません。");
     $(this).focus();
     isEmpty = true;
     return false;
     } 
   });
   if(isEmpty)
       return false;
   else
       alert('送信完了！');
  });
 });