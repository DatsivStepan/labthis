<?php echo $header; ?>
<div class="way_wr_box mw clf">
    <div class="way_box bw clf">
        <ul class="clf">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>

        <p class="way_art fl clf"><?= $heading_title; ?></p>
    </div>
</div>

<div class="cont_wr mw clf">
    <div class="cont_box bw clf">
        <div class="back_box_wr mw clf">
            <a class="hb" href="/">На главную</a>
        </div>
        <div class="cont_text fix_p cb mw clf">
            <p class="baskt_art"><?php echo $text_error; ?></p>
        </div>
<!--        <div id="content" class="<?php echo $class; ?>">
            <p style="text-align: center"><?php echo $text_error; ?></p>
        </div>-->
    </div>
</div>

<?php echo $footer; ?>