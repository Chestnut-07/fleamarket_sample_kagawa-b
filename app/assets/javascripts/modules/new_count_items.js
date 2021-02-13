$(function() {
  $('#item_introduction').on("keyup", function(){
    let countNum = String($(this).val().length);
    $(".counter").html(countNum + "/1000");
  });
});