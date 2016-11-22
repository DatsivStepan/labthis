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
      <?php if ($description) { ?>
      <div class="cont_box bw clf">
        <?php if ($description) { ?>
            <?php echo $description; ?>
        <?php } ?>
      </div>
      <?php } ?>

      <?php if ($products) { ?>
      <!--<div class="row">
        <div class="col-md-4">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />-->
    <div class="item_list_wr mw clf">
        <div class="item_list_box bw clf">
            <?php foreach ($products as $product) { ?>
            <div class="itl_box bshd mw clf">
                <ul class="clf" id="product_<?=$product['product_id'];?>">
                    <input type="hidden" name="product_id" value="<?=$product['product_id'];?>">
                    <li class="itl_name clf"  data-toggle="modal" data-target="#productDescription<?=$product['product_id'];?>"><?php echo $product['name']; ?></li>
                    
                    <div id="productDescription<?=$product['product_id'];?>" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!--<div class="modal-header">
                                    <h4 class="modal-title" style="text-align: center;font: 14px 'nsb'">
                                        <?php echo $product['name']; ?>
                                    </h4>
                                </div>-->
                                <div class="modal-body">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <?= $product['description']; ?>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                    <li class="itl_size clf">
                        <span class="itl_text cb clf">Количество:</span>
                        <div class="namber_box section number-plus-minus fr clf">
                            <input type="number" name="quantity" value="1"  min="1" step="1" />
                        </div>
                    </li>
                    <li class="itl_price clf">
                        <span class="itl_text cb clf">Цена:</span>
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
                    </li>
                    <li class="itl_btn fr clf">
                        <a class="bay_btn hb mw clf" style="cursor:pointer;" tabindex="0" onclick="cart_category.add(<?=$product['product_id'];?>)">В корзину</a>
                    </li>
                </ul>
              <!--<div class="product-thumb">
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                <div>
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
                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
              </div>-->
            </div>
            <?php } ?>
          </div>
          <!--<div class="row">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <div class="col-sm-6 text-right"><?php echo $results; ?></div>
          </div>-->
          <?php } ?>
          <!--<?php if (!$categories && !$products) { ?>
          <p><?php echo $text_empty; ?></p>
          <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
          </div>
          <?php } ?>-->
        </div>
    </div>
<?php echo $footer; ?>
