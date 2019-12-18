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
});

