$(function(){
  
  $('.RegistrationForm').on('change','#categories',function(){
    alert('change!')
    $(this).nextAll().remove()
  })
})