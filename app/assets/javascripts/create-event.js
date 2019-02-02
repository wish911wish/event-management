$(document).on("turbolinks:load", function() {

  $(".js-group").on("click", function() {
    $(".js-group__list:not(:animated)").slideDown();
  });

  $(".js-group__candidate").on("click", function() {
    var group_id = $(this).attr("group_id")
    $("#event_group_id").attr("value", group_id);
    $(".js-group").empty().prepend($(this).clone());
    $(".js-group__list").removeAttr("style").attr("display", "none");
  });
})
