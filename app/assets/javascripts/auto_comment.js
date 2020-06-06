$(function(){
  
  function buildHTML(comment){
    
       
        var html =
         `<div class="commentText__list" data-comment-id=${comment.id}>
         <div class="commentText__list__icon">
         <i class="fa fa-user"></i>
         </div>
         <div class="commentText__list__content">
         <div class="commentText__list__content__name">
         ${comment.user_name}
         </div>
         <div class="commentText__list__content__message">
         ${comment.text}
         </div>
         <div class="commentText__list__content__date">
         ${comment.created_at}
         </div>
         </div>`
        return html;
    }
    
      var reloadMessages = function() {
        
        var last_comment_id = $('.commentText__list:last').data("comment-id");
        let item_id = $(".commentText").data("item-id");
        $.ajax({
          url: `${item_id}/api/comments`,
          type: 'get',
          dataType: 'json',
          data: {id: last_comment_id}
        })
        .done(function(comments) {
         
          if (comments.length !== 0) {
            var insertHTML = '';
            $.each(comments, function(i, comment) {
              insertHTML += buildHTML(comment)
            });
            $('.commentText').append(insertHTML);
            $('.commentText__list').animate({ scrollTop: $('.commentText__list')[0].scrollHeight});
          }
        })
        .fail(function() {
          alert('error');
        });
      };
      if (document.location.href.match(/\/items\/d+/)) {
        setInterval(reloadMessages, 7000);
      }
    });