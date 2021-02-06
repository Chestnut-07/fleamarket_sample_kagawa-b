$(function(){
  
  $('.RegistrationForm').on('change','#categories',function(){
    alert('change!')
    $(this).nextAll().remove()
    const category_id = $(this).val()
  })
})