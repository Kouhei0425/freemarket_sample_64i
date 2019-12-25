$( function() {

    function Buildlink2(name, id){
      var html = `
      <a class="header-cat-nav-category--2--li" value=${id} href="/categories/${id}">${name}</a>
      `
      $(".header-cat-nav-category--2").append(html);
    }

    function Buildlink3(name, id){
      var html = `
      <a class="header-cat-nav-category--3--li" value=${id} href="/categories/${id}">${name}</a>
      `
      $(".header-cat-nav-category--3").append(html);
    }
    //最初の１
    $(document).on('mouseover', '.header-nav-cat', function() {

      $(".header-cat-nav-category").css({
        'display' : `flex`
      })
      $(".header-cat-nav-category--1").css({
        'visibility': `visible`
      })
      $(".header-cat-nav-category--2").css({
        'visibility': `hidden`
      })
      $(".header-cat-nav-category--3").css({
        'visibility': `hidden`
      })
    })
    $(document).on('mouseout', '.header-nav-cat', function() {
      $(".header-cat-nav-category--1").css({
        'visibility': `hidden`
      })
      $(".header-cat-nav-category").css({
        'display' : `none`
      })
    })


  $(document).on('mouseover', '.header-cat-nav-category--1--li', function() {
    $(".header-cat-nav-category--2--li").remove();
    $(".header-cat-nav-category").css({
      'display' : `flex`
    })
    $(".header-cat-nav-category--1").css({
      'visibility': `visible`
    })
    $(".header-cat-nav-category--2").css({
      'visibility': `visible`
    })
    $(".header-cat-nav-category--3").css({
      'visibility': `hidden`
    })
    var id = $(this).attr('value');
    $.ajax({
      type: 'GET',
      url: '/toppage',
      data: {
            parent_id: id
      },
      dataType: 'json'
    })
    .done(function(data) {
      $.each(data, function(index, value){
        Buildlink2(value.name, value.id )
      })
    })
    .fail(function() {
      alert('error');
    });
  });
   
  $(document).on('mouseout', '.header-cat-nav-category--1--li', function() {
    $(".header-cat-nav-category").css({
      'display' : `flex`
    })
    $(".header-cat-nav-category--1").css({
      'visibility': `hidden`
    })
    $(".header-cat-nav-category--2").css({
      'visibility': `hidden`
    })
  })

  $(document).on('mouseover', '.header-cat-nav-category--2--li', function() {
    $(".header-cat-nav-category--3--li").remove();
    $(".header-cat-nav-category").css({
      'display' : `flex`
    })
    $(".header-cat-nav-category--1").css({
      'visibility': `visible`
    })
    $(".header-cat-nav-category--2").css({
      'visibility': `visible`
    })
    $(".header-cat-nav-category--3").css({
      'visibility': `visible`
    })
    var id = $(this).attr('value');
    $.ajax({
      type: 'GET',
      url: '/toppage',
      data: {
            parent_id: id
      },
      dataType: 'json'
    })
    .done(function(data) {
      $.each(data, function(index, value){
        Buildlink3(value.name, value.id )
      })
    })
    .fail(function() {
      alert('error');
    });
  });

});