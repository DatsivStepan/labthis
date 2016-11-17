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
        <div class="cont_box bw clf">
            <?php echo $d_quickcheckout; ?>
        </div>
    </div>

<?php echo $footer; ?>