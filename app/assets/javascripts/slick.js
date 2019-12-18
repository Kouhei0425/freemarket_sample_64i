$(document).on('turbolinks:load', function(){
  $('.item-box__detail__img__top').slick({
    infinite: true, //スライドのループ有効化
    arrows: false, //矢印非表示
    fade: true, //フェードの有効化
    draggable: false //ドラッグ操作の無効化
  });
  $('.small-images').slick({
    infinite: true, //スライドのループ有効化
    slidesToShow: 10, //表示するスライドの数
    focusOnSelect: true, //フォーカスの有効化
    asNavFor: '.thumbnail', //thumbnailクラスのナビゲーション
  });

});