$(function(){
  $('#file').change(function() {
    var fr = new FileReader();
    fr.onload = function() {
      var img = $('<img>').attr('src', fr.result);
      $('#preview').append(img);
    };
    fr.readAsDataURL(this.files[0]);
  });
  var formData = new FormData();
 var dropZone = document.getElementById("drop_zone");

dropZone.addEventListener("dragover", function(e) {
  e.stopPropagation();
  e.preventDefault();

  this.style.background = "#ff3399";
}, false);

dropZone.addEventListener("dragleave", function(e) {
  e.stopPropagation();
  e.preventDefault();

  this.style.background = "#ffffff";
}, false);

dropZone.addEventListener("drop", function(e) {
  e.stopPropagation();
  e.preventDefault();

  this.style.background = "#ffffff";

  var files = e.dataTransfer.files;
  for (var i = 0; i < files.length; i++) {
    (function() {
      var fr = new FileReader();
      fr.onload = function() {
        var div = document.createElement('div');

        var img = document.createElement('img');
        img.setAttribute('src', fr.result);
        div.appendChild(img);

        var preview = document.getElementById("preview");
        preview.appendChild(div);
      };
      fr.readAsDataURL(files[i]);
    })();

    formData.append("file", files[i]);
  }
 }, false);
})
