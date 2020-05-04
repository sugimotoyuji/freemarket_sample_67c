$(document).on('turbolinks:load', function(){

    const prevContent = $('.label-content').prev();
    //プレビューのhtmlを定義
    function buildHTML(id,image) {
      var html = `<div class="preview-box" id="preview-box__${id}">
                    <div class="upper-box">
                      <img src=${image} alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                      </div>
                      <div class="delete-box" id="delete_btn_${id}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    //ラベルのwidth・id・forの値を変更==================================================
    function setLabel(count) {
      //プレビューが5個あったらラベルを隠す
      if (count == 5) { 
        $('.label-content').hide();
      } else {
        //プレビューが4個以下の場合はラベルを表示
        $('.label-content').show();
        //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
        labelWidth = (620 - parseInt($(prevContent).css('width')));
        $('.label-content').css('width', labelWidth);
        //id・forの値を変更
        $('.label-box').attr({for: `item_images_attributes_${count}_image`});
      }
    }

    //編集ページ(items/:i/edit)へリンクした際のアクション==================================
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      //プレビューの数を取得
      var count = $('.preview-box').length;
      //countに応じてラベルのwidth・id・forの値を変更
      setLabel(count) 
    }



    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //htmlを作成
        var html = buildHTML(id,image);
        //ラベルの直前のプレビュー群にプレビューを追加
        var prevContent = $('.label-content').prev();
        $(prevContent).append(html);
        //プレビュー削除したフィールドにチェックボックスがあった場合、チェックを外す
        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        }
        ////プレビューの数を取得
        var count = $('.preview-box').length;
        //countに応じてラベルのwidth・id・forの値を変更
        setLabel(count);
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      //item_images_attributes_${id}_image から${id}に入った数字のみを抽出
      if ($(`#item_images_attributes_${id}__destroy`).length) {
        $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
      }
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //取得したidに該当するプレビューを削除
      $(`#preview-box__${id}`).remove();
      //フォームの中身を削除 
      $(`#item_images_attributes_${id}_image`).val("");
      //プレビューの数を取得
      var count = $('.preview-box').length;
      //countに応じてラベルのwidth・id・forの値を変更
      setLabel(count);
    });
});