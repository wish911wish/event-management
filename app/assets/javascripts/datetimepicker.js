$(document).on("turbolinks:load", function() {

  $("#datetimepicker_serch").datetimepicker({
    format: 'L',
    locale: moment.locale('ja', {
    week: { dow: 1 }
    }),
  });

  $("#start_time").datetimepicker({
    stepping: 15,
  });

  $("#end_time").datetimepicker({
    stepping: 15,
  });

})
