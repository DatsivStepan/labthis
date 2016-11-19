<div class="main_sl_box mw clf">

        <?php foreach ($banners as $banner) { ?>
            <div class="ls_item_box">
                <?php if ($banner['link']) { ?>
                    <img src="<?php echo $banner['image']; ?>">
                <?php } else { ?>
                    <img src="<?php echo $banner['image']; ?>">
                <?php } ?>
                <div class="ls_item">
                    <!--<p>Лучшие цены на испытания<br/> в Москве и Московской<br/> области</p>-->
                </div>
          </div>
        <?php } ?>
    
</div> 
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
--></script>