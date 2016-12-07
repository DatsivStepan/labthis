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
    <div class="back_box_wr mw clf">
        <a class="hb dmcart" href="/">Вернуться в каталог</a>
    </div>
    <div class="cont_box bw cl">
            <h1 style="text-align: center;font: 25px 'nsb';">Ваш заказ принят.</h1>
            <h2 style="text-align: center;font: 18px 'nsb';"> Скоро с Вами свяжется наш менеджер</h2>
        </div>
    </div>
</div>
<?php echo $footer; ?>