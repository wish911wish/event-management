
// ajax化の廃止 //

// $(document).on("turbolinks:load", function() {

//   $(".js-serch-event__button").on("click", function(e){
//     e.preventDefault();
//     var date = $('.js-serch-event__input').val();
//     var url = $('.js-serch-event').attr("action");
//     $.ajax({
//       url: url,
//       type: "GET",
//       data: { serch_date: date },
//       dataType: 'json',
//     })
//     .done(function(events, status){
//       $(".js-event-index").empty();
//       $(".paginator").empty();
//       $('.js-event-index').prepend(events.event_list)
//       $('.paginator').html(events.paginator)
//     })
//     .fail(function(data){
//       alert('エラーです。日付検索が失敗しました。');
//     })
//   })
// });
