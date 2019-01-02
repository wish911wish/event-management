$(document).on("turbolinks:load", function() {
  $(".global-menu__trigger").on("click", function(){
    $(".js-toggle-menu").toggleClass("active");
  })
})
