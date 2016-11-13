<div class="product_sl_wr mw clf">
    <!--Product Art-->
    <p class="product_art clf">ПОПУЛЯРНЫЕ ТОВАРЫ</p>
    <!--Product Slider Box-->
    <div class="product_sl bw clf">
                    <?php $last_element = count($products); ?>
                    <?php foreach ($products as $key => $product) { ?>
                                <?php if(($key == 0) || ($key == 4)){ ?>
                                    <div class="product_sl_box mw clf">
                                <?php } ?>
                                    <!--Product Item-->
                                    <div class="product_item bshd clf">
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

                                        <a class="bay_btn hb mw clf" onclick="cart_category.add(<?=$product['product_id']; ?>)">В корзину</a>
                                    </div>
                                <?php if(($key == 3) || ($key == 4) || ($key == $last_element)){ ?>
                                    </div>
                                <?php } ?>
                    
                    
                                <!--<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                  <div class="product-thumb transition">
                                    <div class="image">
                                        <a href="<?php echo $product['href']; ?>">
                                            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                                    <div class="caption">
                                      <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                                      <p><?php echo $product['description']; ?></p>
                                      <?php if ($product['rating']) { ?>
                                      <div class="rating">
                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                        <?php if ($product['rating'] < $i) { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                                        <?php } else { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                                        <?php } ?>
                                        <?php } ?>
                                      </div>
                                      <?php } ?>
                                      <?php if ($product['price']) { ?>
                                      <p class="price">
                                        <?php if (!$product['special']) { ?>
                                        <?php echo $product['price']; ?>
                                        <?php } else { ?>
                                        <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                        <?php } ?>
                                        <?php if ($product['tax']) { ?>
                                        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                        <?php } ?>
                                      </p>
                                      <?php } ?>
                                    </div>
                                    <div class="button-group">
                                      <button type="button" ><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                      <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                      <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                                    </div>
                                  </div>
                                </div> -->
                    <?php } ?>



    </div>
</div>