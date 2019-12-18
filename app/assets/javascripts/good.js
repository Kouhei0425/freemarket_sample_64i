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
      var tax = price/10;
      var profit = tax * 9;
      $('.buyfee--hyphen').text(tax);
      $('.buyfee--profit__hyphen').text(profit)
      $('.price-form__yen').text();
    }else{
      $('.buyfee--hyphen').text("-");
      $('.buyfee--profit__hyphen').text("-");
    }
  })
});

