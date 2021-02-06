$(function(){
  
  $('.RegistrationForm').on('change','#categories',function(){
    alert('change!')
    $(this).nextAll().remove()
    const category_id = $(this).val()

    $.ajax({
      type: "GET",
      url: "api/items/categories",
      data: {category_id: category_id},
      dataType: 'json'
    })
  })
})