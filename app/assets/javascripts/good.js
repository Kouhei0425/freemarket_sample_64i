$(function(){


  $("#burden").on("change", function() {
    var value = $(this).val();
    if (value) {
      $('.method-select').removeClass("hidden");
    }
    else{
      $('.method-select').addClass("hidden");
    }
  });
  
  

  $('.price-input').on('keyup', function(){
    var price = $(this).val();
    if (price){
      var tax = Math.round(price/10);
      var profit = Math.round(tax * 9);
      $('.buyfee--hyphen').text(tax);
      $('.buyfee--hyphen').prepend('¥');
      $('.buyfee--profit__hyphen').text(profit);
      $('.buyfee--profit__hyphen').prepend('¥');
    }else{
      $('.buyfee--hyphen').text("-");
      $('.buyfee--profit__hyphen').text("-");
    }
  })
});

