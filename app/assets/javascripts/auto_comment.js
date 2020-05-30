$(function(){
  
  function buildHTML(message){
    
        //data-idが反映されるようにしている
        var html =
         `<div class="commentText__list">
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
        //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
        var last_comment_id = $('.commentText__list:last').data("comment-id");
        $.ajax({
          //ルーティングで設定した通りのURLを指定
          url: "api/items",
          //ルーティングで設定した通りhttpメソッドをgetに指定
          type: 'get',
          dataType: 'json',
          //dataオプションでリクエストに値を含める
          data: {id: last_comment_id}
        })
        .done(function(comments) {
          if (comments.length !== 0) {
            //追加するHTMLの入れ物を作る
            var insertHTML = '';
            //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
            $.each(comments, function(i, comment) {
              insertHTML += buildHTML(comment)
            });
            //メッセージが入ったHTMLに、入れ物ごと追加
            $('.commentText__list').append(insertHTML);
            $('.commentText__list').animate({ scrollTop: $('.commentText__list')[0].scrollHeight});
          }
        })
        .fail(function() {
          alert('error');
        });
      };
      if (document.location.href.match(/\/\d+\/comments/)) {
        setInterval(reloadMessages, 7000);
      }
    });