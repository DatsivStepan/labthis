<?php echo $header; ?>
<!--<div class="container">-->
  <!--<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul> -->
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
            <!--Back Box-->
            <div class="back_box_wr mw clf">
                <a class="hb" href="/">Вернуться на главную</a>
            </div>
            <?php echo $description; ?>
        </div>
    </div>
  <!--<div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div> -->
<?php echo $footer; ?> 