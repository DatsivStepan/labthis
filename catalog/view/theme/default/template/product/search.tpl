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
            <div class="product_item bshd clf">
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
                <div id="productDescription<?=$product['product_id'];?>" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <?= $product['description']; ?>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="it_text_box">
                    <p class="it_name fl clf"><?=$product['name']; ?></p>
                    <p class="it_articul fl clf"><?=$product['model']; ?></p>
                </div>
                <span class="it_split mw clf"></span>

                <div class="it_price_box mw clf">
                    <span class="it_price fl clf">360 руб.</span>

                    <div class="namber_box section number-plus-minus fr clf">
                        <input type="number" value="1" min="1" step="1"/>
                    </div>
                </div>


                <div class="it_info_box mw clf">
                    <p>Товар прошел лабораторные испытания</p>
                    <img src="./image/catalog/ico/check.jpg" alt="img">
                </div>

                <a class="bay_btn hb mw clf" onclick="cart_category.add(<?=$product['product_id'];?>)">В корзину</a>
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