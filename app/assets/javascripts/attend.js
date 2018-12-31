$(function(){

  function buildHTML(user){
    var html = `<li class="border-bottom js-add-attend">${user.user_name}</li>`
    return html;
  }

  // function updateAttendStatus(e){
  //   e.preventDefault();
  //   var formData = new FormData(this);
  //   var url = $(this).attr("href")
  //   console.log(url)
  //   $.ajax({
  //     url: url,
  //     type: "POST",
  //     data: formData,
  //     dataType: 'json',
  //     processData: false,
  //     contentType: false
  //   })
  //   .done(function(data, status){
  //     console.log(data);
  //     console.log(status);
  //     var html = buildHTML(data);
  //     console.log(html)
  // }

  $(".participation-btn").on("click", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("href")
    console.log(url)
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data, status){
      console.log(data);
      console.log(status);
      var html = buildHTML(data);
      console.log(html)
      $('.js-add-attend').remove()
      $('.participant-list').prepend(html)
    })
  })

  $(".absence-btn").on("click", function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("href")
    console.log(url)
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data, status){
      console.log(data);
      console.log(status);
      var html = buildHTML(data);
      console.log(html)
      $('.js-add-attend').remove()
      $('.absentee-list').prepend(html)
    })
  })



})
