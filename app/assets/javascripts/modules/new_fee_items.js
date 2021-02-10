$(function() {
  $('#item_price').on("change", function(){
    let countNum = $(this).val();
    let fee = Math.floor(countNum * 0.1);
    let profit = countNum - fee;
    if (countNum >= 300){
      $('.FormItemPanel__Feevalue').html(fee);
      $('.FormItemPanel__Totalvalue').html(profit);
    } else {
      $('.FormItemPanel__Feevalue').html("ー");
      $('.FormItemPanel__Totalvalue').html("ー");
    }
  });
});