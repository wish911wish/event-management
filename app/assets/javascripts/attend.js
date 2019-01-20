$(document).on("turbolinks:load", function() {

  function buildHTML(user){
    var html = `<li class="border-bottom js-add-attend" id="user-id_${user.user_id}" >${user.user_name}</li>`
    return html;
  }

  function removeOldAttendHTML(user){
    var deleteElement = `#user-id_${user.user_id}`
    $(deleteElement).remove()
  }

  function updateAttend(e, obj, attendList){
    e.preventDefault();
    e.stopPropagation();
    var formData = new FormData(obj);
    var url = $(obj).attr("href")
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
      attendList.prepend(html)
    })
    .fail(function(data){
      alert('エラーです。出欠情報が更新されませんでした。');
    })
  }

  $(".js-participation").on("click", function(e){
    var obj = this
    var attendList = $('.participant-list')
    updateAttend(e, obj, attendList);
  })

  $(".js-absence").on("click", function(e){
    var obj = this
    var attendList = $('.absentee-list')
    updateAttend(e, obj, attendList);
  });
});
