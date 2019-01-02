$(document).on("turbolinks:load", function() {

  function buildHTML(user){
    var html = `<li class="border-bottom js-add-attend" id="user-id_${user.user_id}" >${user.user_name}</li>`
    return html;
  }

  function removeOldAttendHTML(user){
    var deleteElement = `#user-id_${user.user_id}`
    $(deleteElement).remove()
  }

  $(".participation-btn").on("click", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("href")
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data, status){
      var html = buildHTML(data);
      removeOldAttendHTML(data);
      $('.participant-list').prepend(html)
    })
    .fail(function(data){
      alert('エラーです。出欠情報が更新されませんでした。');
    })
  })

  $(".absence-btn").on("click", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("href")
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data, status){
      var html = buildHTML(data);
      removeOldAttendHTML(data);
      $('.absentee-list').prepend(html)
    });
  });
});
