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

    <?php if ($categories) { ?>
    <div class="cont_box bw clf">
        <div class="cont_text fix_p font_stl fl mw clf">
            <ul class="catalog_box bw clf">
                <?php foreach ($categories as $category) { ?>
                <li>
                    <a href="<?=$category['href'];?>">
                        <img src="<?=$category['image'];?>" alt="img">
                        <span><?=$category['name'];?></span>
                    </a>
                </li>
                <!--<div class="col-sm-3">
                    <ul>
                        <?php foreach ($categories as $category) { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>-->
                <?php } ?>
            </ul>
        </div>
    </div>
    <?php } ?>
    <?php if ($products) { ?>
    <!--<p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
    <div class="row">
        <div class="col-md-4">
            <div class="btn-group hidden-xs">
                <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip"
                        title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip"
                        title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
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
                <option value="<?php echo $limits['href']; ?>"
                        selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
        </div>
    </div>
    <br/>-->
    <div class="back_box_wr mw clf">
        <div class="box_filtr fl clf">
            <p class="fl">Сортировать по:</p>
            <a class="fl" href="#">популярности</a>
        </div>

        <div class="range_sl_box fr clf">

            <p class="fl clf">Цена, руб.</p>

            <div class="range_box fl clf">
                <span id="min_price" class="fl clf">0</span>
                <span id="max_price" class="fr clf">7500</span>

                <div id="slider-range" class="noUi-target noUi-ltr noUi-horizontal"><div class="noUi-base"><div class="noUi-origin" style="left: 0%;"><div class="noUi-handle" data-handle="0" style="z-index: 5;"></div></div><div class="noUi-connect" style="left: 0%; right: 25%;"></div><div class="noUi-origin" style="left: 75%;"><div class="noUi-handle" data-handle="1" style="z-index: 4;"></div></div></div></div>
            </div>
        </div>
    </div>
    <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
            <div class="product-thumb">
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                                  alt="<?php echo $product['name']; ?>"
                                                                                  title="<?php echo $product['name']; ?>"
                                                                                  class="img-responsive"/></a></div>
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
                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                        class="fa fa-star-o fa-stack-2x"></i></span>
                            <?php } ?>
                            <?php } ?>
                        </div>
                        <?php } ?>
                        <?php if ($product['price']) { ?>
                        <p class="price">
                            <?php if (!$product['special']) { ?>
                            <?php echo $product['price']; ?>
                            <?php } else { ?>
                            <span class="price-new"><?php echo $product['special']; ?></span> <span
                                    class="price-old"><?php echo $product['price']; ?></span>
                            <?php } ?>
                            <?php if ($product['tax']) { ?>
                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                            <?php } ?>
                        </p>
                        <?php } ?>
                    </div>
                    <div class="button-group">
                        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i
                                    class="fa fa-shopping-cart"></i> <span
                                    class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"
                                onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i
                                    class="fa fa-heart"></i></button>
                        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>"
                                onclick="compare.add('<?php echo $product['product_id']; ?>');"><i
                                    class="fa fa-exchange"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>
    <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
    </div>
    <?php } ?>
    <?php if (!$categories && !$products) { ?>
    <p><?php echo $text_empty; ?></p>
    <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>"
                                   class="btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>
</div>
</div>
<?php echo $footer; ?>
