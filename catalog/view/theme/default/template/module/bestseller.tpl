<div class="product_sl_wr mw clf">
    <!--Product Art-->
    <p class="product_art clf">ПОПУЛЯРНЫЕ ТОВАРЫ</p>
    <!--Product Slider Box-->
    <div class="product_sl bw clf">
            <?php $last_element = count($products)-1; ?>
            <?php foreach ($products as $key => $product) { ?>
                        <?php if(($key == 0) || ($key == 4)){ ?>
                            <div class="product_sl_box mw clf">
                        <?php } ?>
                            
                            <div class="product_item bshd clf" id="product_<?=$product['product_id']; ?>">
                                <div class="img_box mw clf">
                                    <a href="<?=$product['href'];?>">
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

                                <div class="it_info_box mw clf product_option_<?=$product['product_id']; ?>">
                                    <?php foreach($product['options'] as $option){ ?>
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
                                                        <input type="checkbox" class="checkLabIsputC" id="styleInput_<?=$product['product_id']; ?>"   data-product_id="<?=$product['product_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                        <label for="styleInput_<?=$product['product_id']; ?>"></label>
                                                    </div>
                                                </div>

                                            <?php } ?>
                                          </div>
                                        </div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>

                                <a class="bay_btn hb mw clf" style="cursor:pointer;"  onclick="cart_category.add(<?=$product['product_id'];?>)">В корзину</a>
                            </div>
                        
                            <!--<div class="product_item bshd clf">
                                <div class="img_box mw clf">
                                    <a href="<?php echo $product['href']; ?>">
                                        <img src="<?php echo $product['thumb']; ?>" alt="img">
                                    </a>
                                </div>
                                <div class="it_text_box">
                                    <p class="it_name fl clf"><?= $product['name']; ?></p>
                                    <p class="it_articul fl clf"><?= $product['model']; ?></p>
                                </div>
                                <span class="it_split mw clf"></span>

                                <div class="it_price_box mw clf">
                                    <?php if ($product['price']) { ?>
                                        <span class="it_price fl clf">
                                            <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                            <?php } else { ?>
                                                <?php echo $product['price']; ?>
                                            <?php } ?>
                                            <?php if ($product['tax']) { ?>
                                                <?php echo $text_tax; ?> <?php echo $product['tax']; ?>
                                            <?php } ?>
                                        </span>
                                    <?php } ?>

                                    <div class="namber_box section number-plus-minus fr clf" id="product_<?=$product['product_id']; ?>">
                                        <input type="number" value="1"  min="1" step="1" />
                                    </div>
                                </div>

                                <div class="it_info_box mw clf">
                                    <p>Товар прошел лабораторные испытания</p>
                                    <img src="/image/catalog/ico/check.jpg" alt="img">
                                </div>

                                <a class="bay_btn hb mw clf" style="cursor:pointer;" onclick="cart_category.add(<?=$product['product_id']; ?>)">В корзину</a>
                            </div> -->
                        <?php if(($key == 3) || ($key == 7) || ($key == $last_element)){ ?>
                            </div>
                        <?php } ?>

           <?php } ?>

    </div>
</div>