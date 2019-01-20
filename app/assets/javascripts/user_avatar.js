$(document).on("turbolinks:load", function() {

  function previewUserImage(files){
    resetPreview();
    for (var i = 0; i < files.length; i++){
      var file = files[i];
      if (file.type.indexOf("image") < 0){
        continue;
      }
      var img = document.createElement("img");
      img.classList.add("previewImage");
      img.file = file;
      img.height = 200;
      document.getElementsByClassName('image-display-area')[0].appendChild(img);
      var reader = new FileReader();
      reader.onload = (function(tImg) { return function(e) { tImg.src = e.target.result; }; })(img);
      reader.readAsDataURL(file);
    }
  }

  function resetPreview(){
    var element = document.getElementsByClassName('image-display-area')[0]

   while (element.firstChild) {
      element.removeChild(element.firstChild);
   }
  }

  $(".js-upload-image").on("change", function(e) {
    var file = e.target.files
    previewUserImage(file)
  });
})



