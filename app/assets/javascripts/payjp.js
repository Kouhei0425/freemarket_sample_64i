$(document).on('turbolinks:load', function() {
  var form = $("#charge-form");
  Payjp.setPublicKey('pk_test_26b39b7573f5729ae2218fa4');

  // Formがsubmitされた時にイベント発火させ、それぞれform要素のvalueを取り出します
  $(document).on("click", "#token_submit", function(e) {

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    var card = {
        number: $("#card_no").val(),
        cvc: $("#cvc").val(),
        exp_month: $("#exp_month").val(),
        exp_year: $("#exp_year").val(),
    };

    // Payjp.createTokenというメソッドを使ってトークンを作成
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('トークン作成エラー発生');
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        var token = response.id;

        // formにinput要素をappendして、name属性にトークンのキー名を指定
        // トークン作成後はトークンがパラメーターとしてコントローラーに送られる
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      }
    });
  });
});
