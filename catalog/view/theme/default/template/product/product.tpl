<?php echo $header; ?>
<div class="way_wr_box mw clf">
    <div class="way_box bw clf">
        <ul class="clf">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>

        <p class="way_art fl clf"><?php echo $heading_title; ?></p>
    </div>
</div>
<div class="cont_wr mw clf">
    <!--Content Box-->
    <div class="cont_box bw cl">
        <!--Back Box-->
        <div class="back_box_wr mw clf">
            <a class="hb" href="#">Вернуться на главную</a>
        </div>
        <div class="item_sl_box fl clf">
            <?php if ($images) { ?>
                <ul class="item_sl clf">
                    <?php foreach ($images as $image) { ?>
                        <li>
                            <a class="fancybox" rel="gallery1" href="<?php echo $image['thumb']; ?>">
                                <img src="<?php echo $image['thumb']; ?>" alt="img">
                            </a>
                        </li>
                    <?php } ?>
                </ul>

                <ul class="item_sl_nav clf">
                    <?php foreach ($images as $image) { ?>
                        <li><img src="<?php echo $image['thumb']; ?>" alt="img"></li>
                    <?php } ?>
                </ul>
            <?php } ?>
        </div>
        
        <div class="text_wr it_w fr clf" id="product">
            <div class="it_price_box mw clf">
                <input type="hidden" name="product_id" value="<?= $product_id; ?>"/>
                <?php if ($price) { ?>
                    <input type="hidden" class="productOldPrice" value="<?= $price; ?>"/>
                    <p class="productPrice">
                        <?= $price; ?>
                    </p>
                <?php } ?>

                <div class="it_size fl clf" >
                    <span class="itl_text cb clf">Количество:</span>
                    <div class="namber_box section number-plus-minus fr clf quantityProductP">
                        <input type="number" name="quantity" value="<?php echo $minimum; ?>" min="1" size="2" id="input-quantity" data-product_id="" />
                    </div>
                </div>
                <br />
                <div class="it_chesk fl clf">
                    <!--<p class="fl clf">Товар прошел лабораторные испытания</p>
                    <img class="fr clf" src="/image/catalog/ico/check.jpg" alt="img"> -->
                    <?php foreach($options as $option){ ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                          <div id="input-option<?php echo $option['product_option_id']; ?>">
                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                            <div class="col-sm-10 fl clf" style="font: 14px 'nsr';padding:0px;">
                                <?php echo $option_value['name']; ?>
                            </div>
                            <div class="col-sm-2" >
                                <?php if ($option_value['price']) { ?>
                                    <input type="hidden" value="<?php echo $option_value['price']; ?>" class="hiddenOprionValue">
                                <?php } ?>
                                <div class="styleInputContainer">
                                    <input type="checkbox" class="checkLabIsput" id="styleInput_<?= $product_id; ?>" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                    <label for="styleInput_<?= $product_id; ?>"></label>
                                </div>
                            </div>
                            <?php } ?>
                          </div>
                        </div>
                        <?php } ?>
                    <?php } ?>
                </div>
            </div>

            <div class="it_btn_box mw clf">
                <a id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="bay_btn hb mw clf"  style="cursor:pointer;">В корзину</a>
                <!--<a class="bay_btn hb mw clf" href="#" tabindex="0">В корзину</a> -->
                <a class="bay_btn_f hb mw clf quickOrder" tabindex="0" style="width:300px;cursor:pointer;">Перейти к оформлению заказа</a>
            </div>

            <div class="it_tech_info_box mw clf">
                <?php if ($attribute_groups) { ?>
                        <h4>Технические характеристики:</h4>

                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <ul class="clf">
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <li>
                                    <span class="tech_info_name fl clf"><?php echo $attribute['name']; ?></span>
                                    <span class="tech_info_val fr clf"><?php echo $attribute['text']; ?></span>
                                </li>
                                <?php } ?>
                            </ul>
                        <?php } ?>
                    <?php } ?>
                <h4>Описание товара:</h4>

                <p>
                    <?php echo $description; ?>
                </p>
                    
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
    var productPrice = 0;
    $(document).on('change','.checkLabIsput',function(){
        var productQuantity = $('.quantityProductP').find('input[name=quantity]').val();
        var productPrice = parseInt($('.productOldPrice').val());
        if($('.checkLabIsput').is(':checked')){
            var OptionValue = parseInt($('.hiddenOprionValue').val());
            var TotalPrice = (productPrice * productQuantity) + (OptionValue * productQuantity);
            $('.productPrice').text(TotalPrice+'р.');
        }else{
            var TotalPrice = productPrice * productQuantity;
            $('.productPrice').text(TotalPrice+'р.');
        }
        /*if($(this).is(':checked')){
            var OptionValue = parseInt($(this).parent().find('.hiddenOprionValue').val());
            productPrice = parseInt($('.productPrice').text());
            var TotalPrice = OptionValue+productPrice;
            $('.productPrice').text(TotalPrice+'р.');
        }else{
            $('.productPrice').text(productPrice+'р.');
        } */
    });
    
    $(document).on('click','.quantityProductP .plus, .quantityProductP .minus',function(){
        var productQuantity = $(this).parent().find('input[name=quantity]').val();
        var productPrice = parseInt($('.productOldPrice').val());
        if($('.checkLabIsput').is(':checked')){
            var OptionValue = parseInt($('.hiddenOprionValue').val());
            var TotalPrice = (productPrice * productQuantity) + (OptionValue * productQuantity);
            $('.productPrice').text(TotalPrice+'р.');
        }else{
            var TotalPrice = productPrice * productQuantity;
            $('.productPrice').text(TotalPrice+'р.');
        }
        //$('#product_'+product_id).find('.productPriceView').text(TotalPrice+'р.');
    })
    
    
    $(document).on('click','.quickOrder',function(){
        $('#button-cart').trigger('click');
        setTimeout(function(){
            document.location = '/index.php?route=checkout/checkout';
        }, 1000);
    })

$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, #product input[name=\'quantity\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});

//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
