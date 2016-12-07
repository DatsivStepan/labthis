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
    <div class="cont_box bw clf">
        <div class="item_list_box fix_m mw clf">
            <?php foreach ($products as $product) { ?>
            <?php 
                $in_category_59 = 'no';
                foreach($product['p_category_id'] as $key => $value){
                    if($value['category_id'] == 59){
                        $in_category_59 = 'yes';
                    }
                }
            ?>
            <!--Product Item-->
            <div class="product_item bshd clf"  id="product_<?=$product['product_id']; ?>">
                <div class="img_box mw clf">
                    <?php if($in_category_59 == 'yes'){
                        $product_href = 'data-toggle="modal" data-target="#productDescription'.$product['product_id'].'"';
                    }else{
                        $product_href = 'href="'.$product['href'].'"';
                    } ?>
                    <a <?= $product_href; ?> >
                        <img src="<?=$product['thumb']; ?>" alt="<?=$product['name']; ?>">
                    </a>
                </div>
                <div class="it_text_box">
                    <p class="it_name fl clf"><?=$product['name']; ?></p>
                    <p class="it_articul fl clf"><?=$product['model']; ?></p>
                </div>
                <span class="it_split mw clf"></span>

                <div class="it_price_box mw clf">
                    <input type="hidden" class="productOldPrice" value="<?= $product['price']; ?>"/>
                    <span class="it_price fl clf productPriceView">
                        <?= $product['price']; ?>
                    </span>
                    <!--id="product_<?=$product['product_id']; ?>" -->
                    <div class="namber_box section number-plus-minus fr clf quantityContainer" data-product_id="<?php echo $product_id; ?>">
                        <input type="hidden" name="product_id" value="<?=$product['product_id']; ?>"/>
                        <input type="number" name="quantity" value="1" min="1" step="1" data-product_id="<?php echo $product['product_id']; ?>"/>
                    </div>
                </div>

                <div class="it_info_box mw clf product_option_<?=$product['product_id']; ?>" style="min-height:38px;">
                    <?php if($product['options']){ ?>
                        <?php foreach($product['options'] as $option){ ?>
                            <?php if ($option['type'] == 'checkbox') { ?>
                            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>" style="margin:0px;">
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
                                            <input type="checkbox" class="checkLabIsputC" id="styleInput_<?=$product['product_id']; ?>"   data-product_id="<?=$product['product_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                            <label for="styleInput_<?=$product['product_id']; ?>"></label>
                                        </div>
                                    </div>

                                <?php } ?>
                              </div>
                            </div>
                            <?php } ?>
                        <?php } ?>
                    <?php } ?>
                </div>

                <a class="bay_btn hb mw clf" style="cursor:pointer;"  onclick="cart_category.add(<?=$product['product_id'];?>)">В корзину</a>
            </div>
            <?php } ?>
        </div>
    </div>

</div>

<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 
<?php echo $footer; ?> 