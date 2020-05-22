$(function() {
  $(document).on("mouseenter", ".inner__bottom__left__categories--categorie", function() {
    $(".child_category").remove();
    $(".categor").css('display','flex');
  });
  $(".inner__bottom__left__categories--categorie").on("mouseleave", function() {
    var hoge = setTimeout(function() {
      $(".categor").css('display','none');
    },500);
    $(".categor2").on("mouseenter", function() {
      $(".child_category").remove();
      clearTimeout(hoge);
    });
  });
  $(".categor").on("mouseleave", function() {
    $(".categor").css('display','none');
  });
  $(".categor2").on("mouseenter", function() {
    $(".child_category").remove();
    var id = this.id
    $("#" + id).css('color','red');
  });
  $(".categor2").on("mouseleave", function() {
    var id = this.id
    $("#" + id).css('color','#333');
  });
  
  function buildChildHTML(child){
    var html = ` <a class="child_category" id="${child.id}" href="items/${child.id}/category_index/">${child.name}</a>`;
    return html;
  }
  $(".categor2").on("mouseenter", function() {
    var id = this.id
    $(".child_category").remove();
    $(".grand_child_category").remove();
    $.ajax({
      type: 'GET',
      url: '/category/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".categor3").append(html);//リストに追加します
      })
      $(".child_category").on("mouseenter", function() {
        var id = this.id
        $("#" + id).css('color','red');
      });
      $(".child_category").on("mouseleave", function() {
        var id = this.id
        $("#" + id).css('color','#333');
      });
    });
  });
  function buildGrandChildHTML(child){
    var html =`<a class="grand_child_category" id="${child.id}"
               href="items/${child.id}/category_index/">${child.name}</a>`;
    return html;
  }
  $(document).on("mouseenter", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
    var id = this.id
    $.ajax({
      type: 'GET',
      url: '/category/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".categor4").append(html);
      })
      $(document).on("mouseenter", ".child_category", function () {
        $(".grand_child_category").remove();
      });
      $(".grand_child_category").on("mouseenter", function() {
        var id = this.id
        $("#" + id).css('color','red');
      });
      $(".grand_child_category").on("mouseleave", function() {
        var id = this.id
        $("#" + id).css('color','#333');
      });
    });
  });  
});  

