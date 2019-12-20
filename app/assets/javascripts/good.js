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

  $('.big-images').slick({
    infinite: true, //スライドのループ有効化
    arrows: false, //矢印非表示
    fade: true, //フェードの有効化
    draggable: false //ドラッグ操作の無効化
  });
  $('.small-images').slick({
    infinite: true, //スライドのループ有効化
    slidesToShow: 8, //表示するスライドの数
    focusOnSelect: true, //フォーカスの有効化
    asNavFor: '.big-images' //thumbnailクラスのナビゲーション
  });
});

$('.fade').slick({
  autoplay: true, //自動再生
  dots: true, //ドットのナビゲーションを表示
  infinite: true, //スライドのループ有効化
  speed: 1000, //切り替えのスピード（小さくすると速くなる）
  fade: true, //フェードの有効化
});

