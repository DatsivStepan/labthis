$(document).ready(function() {
	/*Main SL*/
  $('.main_sl_box').slick({
  	  autoplay: true,
  	  autoplaySpeed: 2990,
  	  pauseOnHover: true,
  	  dots: true,
  	  arrows: true,
	  infinite: true,
	  speed: 300
  });
  /*Item SL*/
  $('.product_sl').slick({
  	  autoplay: true,
  	  autoplaySpeed: 2990,
  	  pauseOnHover: true,
  	  dots: true,
  	  arrows: false,
	  infinite: true,
	  speed: 300
  });

  $('.item_sl').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  fade: false,
	  asNavFor: '.item_sl_nav'
  });
  $('.item_sl_nav').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  asNavFor: '.item_sl',
	  dots: false,
	  centerMode: false,
	  focusOnSelect: true
  });

  /*Inpeut Namb*/
  $('.namber_box input').styler();

  /*Clear Inpu Placeholder*/
  $('input,textarea').focus(function(){
   $(this).data('placeholder',$(this).attr('placeholder'))
   $(this).attr('placeholder','');
 });
 $('input,textarea').blur(function(){
   $(this).attr('placeholder',$(this).data('placeholder'));
 });

  /*File Style*/	
  $('.load_file_box input, .cast_check').styler();

  /*Add/Remo Class*/
	$('.form_box button').click(function(e) {
		
		var tg = e.target || e.srcElement;
		var lv = $('.form_box');
		var x = lv.find('button');
		var stl = $(tg).hasClass('act_btn');

		for (var i = 0; i < x.length; i++) {
			a = x[i];
		}

		if (a = tg) {
			var foo = function() {
				console.log(tg);
				if ( stl != true ) {
					var rem = function() {
						$('.form_box button').removeClass('act_btn'),
						$(tg).addClass('act_btn')
					}
					rem();
				} else {
					$(tg).removeClass('act_btn');
				}
			}
			foo();
		}

	});

	/*Basket Remove Item*/
	$('.close_box').click(function() {
        $(this).parents(".baskr_item_box").slideUp(500,
        	function(){$(this).remove();
        });	
    });
});

/*Range Slider*/
$(document).ready(function() {
	var snapSlider = document.getElementById('slider-range');

	noUiSlider.create(snapSlider, {
		start: [ 0, 7500 ],
		connect: true,
		range: {
			'min': 0,
			'max': 10000
		},
		format: wNumb({
			decimals: 0
		})
	});

	var snapValues = [
	document.getElementById('min_price'),
	document.getElementById('max_price')
	];

	snapSlider.noUiSlider.on('update', function( values, handle ) {
		snapValues[handle].innerHTML = values[handle];
	});
});