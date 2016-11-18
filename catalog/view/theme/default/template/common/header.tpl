<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>-->
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>

<link rel="icon" href="favicon.ico" type="image/x-icon"/>

<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/main.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/slick.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/slick-theme.css" rel="stylesheet">
<!--<link href="catalog/view/theme/default/stylesheet/nouislider.min.css" rel="stylesheet">-->
<link href="catalog/view/theme/default/stylesheet/jquery.formstyler.css" rel="stylesheet">
<link href="catalog/view/theme/default/fonts/fonts.css" rel="stylesheet">

<script src="catalog/view/javascript/slick.js" type="text/javascript"></script>
<!--<script src="catalog/view/javascript/nouislider.js" type="text/javascript"></script>-->
<script src="catalog/view/javascript/wNumb.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.formstyler.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/script.js" type="text/javascript"></script>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<div class="sticky_nav_wr mw clf">
    <div class="sticky_nav bw clf">
        <ul class="clf fl">
            <li><a class="nav_locat" href="#"><?= $address; ?></a></li>
            <li><a class="nav_tel" href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></li>
            <li><a class="nav_app" href="#">Мы есть в Whatsapp / Viber</a></li>
        </ul>

        <div class="bucket_boc fr clf">
            <?php echo $cart; ?>
        </div>
    </div>
</div>
<div class="main_nav_wr mw clf">
    <div class="main_nav bw clf">
        <!--<a class="logo fl clf" href="index.html">
            <img src="img/logo.png" alt="img">
        </a> -->
        <?php if ($logo) { ?>
            <a class="logo fl clf" href="<?php echo $home; ?>">
                <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="img" />
            </a>
        <?php } ?>

        <ul class="main_nav_box fl clf">
            <li><a href="../../../index.php?route=information/information&information_id=4">О компании</a></li>
            <li><a href="../../../index.php?route=information/information&information_id=6">Доставка и оплата</a></li>
            <li><a href="../../../index.php?route=information/contact">Контакты</a></li>
        </ul>

        <div class="nav_search clf fr" id="search">
            <?= $search; ?>
        </div>

        <div class="main_nav_sub fr cb clf">
            <ul class="clf">
                <?php foreach($categories_menu as $category){ ?>
                <li><a href="../../../../index.php?route=product/category&amp;path=<?= $category['category_id']; ?>"><?= $category['name']; ?></a></li>
                <?php } ?>
                    <!--<li><a href="magazin.html">Магазин средств защиты</a></li>
                    <li><a href="catalog.html">Каталог услуг</a></li>
                    <li><a href="srestva_zash_lv2.html">Нормы комплектации средствами защиты</a></li>-->
            </ul>
        </div>
    </div>
</div>
<!--<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav> -->
<!--<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php //echo $search; ?>
      </div>
      <div class="col-sm-3"><?php //echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?> -->
