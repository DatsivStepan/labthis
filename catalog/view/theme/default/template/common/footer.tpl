<div class="footer_wr mw clf">
    <div class="footer bw clf">
        <div class="foot_nav_box fl clf bs">
            <ul class="clf">
                <li><a href="/">главная</a></li>
                <li><a href="../../../index.php?route=information/information&information_id=4">О компании</a></li>
                <li><a href="../../../index.php?route=information/information&information_id=6">Доставка и оплата</a></li>
                <li><a href="../../../index.php?route=information/contact">Контакты</a></li>
            </ul>
        </div>

        <div class="foot_nav_box fl clf bs">
            <ul class="clf">
                <?php foreach($categories_menu as $category){ ?>
                    <li><a href="../../../../index.php?route=product/category&amp;path=<?= $category['category_id']; ?>"><?= $category['name']; ?></a></li>
                <?php } ?>
            </ul>
        </div>

        <div class="foot_info_box fr clf">
            <ul class="foot_info clf fl">
                <li>Адрес: <?= $address; ?></li>
                <li>Телефон: <a href="tel:<?= $telephone; ?>"><?= $telephone; ?></a></li>
                <li>E-mail: <a href="mailto:<?= $email; ?>"><?= $email; ?></a></li>
                <li>Режим работы: <?= $open; ?></li>
            </ul>

            <div class="app_box fr clf">
                <ul class="clf">
                    <li>Мы есть в </li>
                    <li>
                        <a href="<?= $whatsapp; ?>">
                            <img src="../../../image/catalog/ico/wat.png" alt="img">
                        </a>
                    </li>
                    <li>
                        <a href="<?= $viber; ?>">
                            <img src="../../../image/catalog/ico/vib.png" alt="img">
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="split_box fl cb"></div>

        <div class="copy_box fl clf">
            <p>© 2016 Лаборатория средств защиты <a target="_blank" href="#">«Labsiz»</a>. Все права защищены.</p>
        </div>
    </div>
</div>
<!--
<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p> 
  </div>
</footer>-->

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>