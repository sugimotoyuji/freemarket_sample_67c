$(function(){
  function buildHTML(comment){
    var html = `
                  <div class="commentBox__list__content">
                  <div class="commentBox__list__content__name">
                  
                  </div>
                  <div class="commentBox__list__content__message">
                  ${comment.text}
                  </div>
                  <div class="commentBox__list__content__date">
                 
                  </div>
                  </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
  })
})
