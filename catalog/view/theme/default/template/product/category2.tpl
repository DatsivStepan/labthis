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
                <?php } ?>
            </ul>
        </div>
    </div>
    <?php } ?>

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
    <?php if (!$categories && !$products) { ?>
    <div class="cont_box bw clf">
        <div class="back_box_wr mw clf">
            <input type="hidden" value="<?=$base_url; ?>">
            <div class="box_filtr fl clf">
                <p class="fl">Сортировать по:</p>

                <?php $i=0; foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order && $order == 'DESC') { ?>
                <!--<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>-->
                    <a class="fl" href="<?php echo $sorts['href']; ?>">популярности</a>
                <?php } elseif($sorts['value'] == $sort . '-' . $order && $order == 'ASC') { ?>
                <!--<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>-->
                    <a class="fl asc" href="<?php echo $sorts['href']; ?>">популярности</a>
                <?php } ?>
                <?php if(isset($order) && empty($order) && $i == 1){ ?>
                    <a class="fl" href="<?php echo $sorts['href']; ?>">популярности</a>
                <?php } $i++; ?>
                <?php } ?>

            </div>

            <div class="range_sl_box fr clf">
                <p class="fl clf">Цена, руб.</p>
                <div class="range_box fl clf">
                    <span id="min_price" class="fl clf"></span>
                    <span id="max_price" class="fr clf"></span>
                    <div id="slider-range"></div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <?php if ($products) { ?>
    <div class="cont_box bw clf">
        <?php if (count($products) <= 5) { ?>
        <div class="item_list_box fix_m mw clf">
            <?php foreach ($products as $product) { ?>
            <!--Product Item-->
            <div class="product_item bshd clf">
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
                    <span class="it_price fl clf">360 руб.</span>

                    <div class="namber_box section number-plus-minus fr clf" id="product_<?=$product['product_id']; ?>">
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
        <?php } else { ?>
        <?php foreach (array_chunk($products, ceil(count($products) / 4)) as $products) { ?>
        <div class="item_list_box fix_m mw clf">
            <?php foreach ($products as $product) { ?>
            <!--Product Item-->
            <div class="product_item bshd clf">
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
        <?php } ?>
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
        <div class="pull-right"><a href="<?php echo $continue; ?>"
                                   class="btn btn-primary"><?php echo $button_continue; ?></a></div>
    </div>
    <?php } ?>-->
</div>
</div>
<?php echo $footer; ?>

<script>
    /*Range Slider*/
    $(document).ready(function() {
        var snapSlider = document.getElementById('slider-range');

        noUiSlider.create(snapSlider, {
            start: [ <?=$price1;?>, <?=$price2;?> ],
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

        snapSlider.noUiSlider.on('end', function(values, handle){
            var link = '';
            window.location.href = window.location.href + '&price1='+values[0] + '&price2='+values[1];
        });
    });
</script>
