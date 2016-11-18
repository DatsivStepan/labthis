<?php echo $header; ?>

    <div class="way_wr_box mw clf">
        <div class="way_box bw clf">
            <ul class="clf">
                <li><a href="/">Главная</a></li>
                <li><a href="#">Контакты</a></li>
            </ul>

            <p class="way_art fl clf">Контакты</p>
        </div>
    </div>

            <!--Content Wrap Box-->
    <div class="cont_wr mw clf">

        <!--Content Box-->
        <div class="cont_box bw clf">
            <!--Back Box-->
            <div class="back_box_wr mw clf">
                <a class="hb" href="/">Вернуться на главную</a>
            </div>

            <!--Text Box-->
            <div class="cont_text fix_p font_stl fl mw clf">
                <div class="contact_box fl clf">
                    <h2>НАШ АДРЕС</h2>

                    <ul class="clf">
                        <li class='shopAddress'><?= $address; ?></li>
                        <li style='width:110px;'><a href="tel:+<?= $telephone; ?>"><?= $telephone; ?></a>
                        <a href="mailto:<?= $email_shop; ?>"><?= $email_shop; ?></a></li>
                        <li style='width:120px;'>Режим работы:</br><?= $open; ?></li>
                        <li><a data-toggle="modal" data-target="#myModal" class="bay_btn hb mw clf showA"  tabindex="0">Обратная связь</a></li>
                    </ul>


                </div>

                <div id="map" class="map_box ymaps fr clf">
                </div>

            </div>

        </div>

    </div>

    <div class="cont_wr mw clf">
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h2 style="margin:15px 0px 5px 0px;font-size:24px;text-align:center;"><?php echo $text_contact; ?></h2>
                <div class="fcont">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="formContact" class="form-horizontal">
                      <fieldset>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                          <div class="col-sm-10">
                            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                            <?php if ($error_name) { ?>
                            <div class="text-danger"><?php echo $error_name; ?></div>
                            <?php } ?>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                          <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                            <?php if ($error_email) { ?>
                            <div class="text-danger"><?php echo $error_email; ?></div>
                            <?php } ?>
                          </div>
                        </div>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                          <div class="col-sm-10">
                            <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                            <?php if ($error_enquiry) { ?>
                            <div class="text-danger"><?php echo $error_enquiry; ?></div>
                            <?php } ?>
                          </div>
                        </div>
                        <div class="pull-right">
                          <input class="bay_btn hb mw clf" style="border:0px;" type="submit" value="Отправить" />
                        </div>
                        <!--<div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                          <div class="col-sm-10">
                            <input type="text" name="captcha" id="input-captcha" class="form-control" />
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-10 pull-right">
                            <img src="index.php?route=tool/captcha" alt="" />
                            <?php if ($error_captcha) { ?>
                              <div class="text-danger"><?php echo $error_captcha; ?></div>
                            <?php } ?>
                          </div>
                        </div> -->
                      </fieldset>
                    </form>
                  </div>
              </div>
            </div>
          </div>
        </div>
        <!--Content Box-->

  </div>
<?php echo $footer; ?>
