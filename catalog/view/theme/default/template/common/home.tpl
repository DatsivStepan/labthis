<?php echo $header; ?>

        <?php echo $content_top; ?>
            <div class="advantages_box_wr mw clf">
                <div class="advantages_box bw clf">
                    <ul class="clf">
                        <li>
                            <img src="/image/catalog/ico/adv_ico_1.png" alt="img">
                            <p>Выгодные условия сотрудничества</p>
                        </li>
                        <li>
                            <img src="/image/catalog/ico/adv_ico_2.png" alt="img">
                            <p>При покупке в нашем магазине вы защищены от брака на 100%!</p>
                        </li>
                        <li>
                            <img src="/image/catalog/ico/adv_ico_3.png" alt="img">
                            <p>Индивидуальные условия для государственных учреждений</p>
                        </li>
                        <li>
                            <img src="/image/catalog/ico/adv_ico_4.png" alt="img">
                            <p>Специалисты с большим опытом работы в электротехнической лаборатории</p>
                        </li>
                        <li>
                            <img src="/image/catalog/ico/adv_ico_5.png" alt="img">
                            <p>Сертифицированное качество</p>
                        </li>
                        <li>
                            <img src="/image/catalog/ico/adv_ico_6.png" alt="img">
                            <p>Предоставление</br> комплексных видов</br> услуг</p>
                        </li>
                    </ul>
                </div>                
            </div>
            
            <!--Section Box Wrap-->
            <div class="section_box_wr mw">
                <div class="section_box bw clf">
                    <ul class="clf">
                        <?php foreach($categories_menu as $key => $category){ ?>
                                <?php if($category['category_id'] != 60){ ?>
                                    <li>
                                        <a href="/index.php?route=product/category&path=<?= $category['category_id']; ?>">
                                            <img src="image/<?= $category['image']; ?>" alt="img">
                                            <div class="filtr_box clf"></div>
                                            <div class="sect_text"><?= $category['name']; ?></div>
                                        </a>
                                    </li>
                                <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
            </div>

            <!--Product Slider-->
            <?php echo $content_bottom; ?>
            

            <!--Fid Box-->
            <div class="fib_box_wr mw clf">
                <div class="fib_box bw clf">
                    
                    <div class="fib_box_lt font_stl fl clf">

                        <div class="fib_box_text mw clf">
                            <h2>Зачем испытавать средства защиты?</h2>
                            <ul class="clf">
                                <li>Для обеспечения безопасности электротехнического персонала</li>
                                <li>Для успешного прохождения проверки контролирующих организаций</li>
                            </ul>
                        </div>

                        <span class="fib_box_spl"></span>

                        <div class="fib_box_text mw clf">
                            <h2> Нужно ли испытывать вновь купленные средства защиты?</h2>
                            <p>Многие заблуждаются считая, что покупка новых средств защиты освобождает их от испытаний. В <a href="#">«Инструкции по применению и испытанию средств защиты»</a> в пункте 1.4.4 указано: Электрозащитные средства, кроме изолирующих подставок, диэлектрических ковров, переносных заземлений, защитных ограждений, плакатов и знаков безопасности, а также предохранительные монтерские пояса и  страховочные канаты,полученные для эксплуатации от заводов-изготовителей или со складов, должны быть проверены по нормам эксплуатационных испытаний.</p>

                            <blockquote> Испытывайте вовремя свои средства защиты, и вы защитите себя и своих сотрудников от несчастных случает и штрафов проверяющих организаций.
                            </blockquote>
                        </div>
                    </div>

                    <div class="fib_box_rt fr clf">
                        <p>Остались вопросы?</p>
                        <span class="fib_box_spl"></span>
                        <span class="call_back clf">Позвоните нам</span>
                        <a class="fid_namb" href="tel:<?= $telephone; ?>"><?= $telephone; ?></a>
                        <a class="call_btn hb" href="#">Заказать звонок</a>
                    </div>
                </div>
            </div>

            <!--Work Scheme Box-->
            <div class="scheme_box_wr mw clf">
                <div class="scheme_box bw clf">
                    <p class="cheme_art clf">СХЕМА НАШЕЙ РАБОТЫ</p>
                    <ul class="clf">
                        <li>
                            <img src="/image/catalog/schem_1.png" alt="img">
                            <p>Оформляете он-лайн заказ на сайте или отправляете заявку на почту</p>
                        </li>
                        <li>
                            <img src="/image/catalog/schem_2.png" alt="img">
                            <p>В ответ на заявку вам перезвонит менеджер и уточнит детали заявки</p>
                        </li>
                        <li>
                            <img src="/image/catalog/schem_3.png" alt="img">
                            <p>Мы выставим вам счет и оформим договор</p>
                        </li>
                        <li>
                            <img src="/image/catalog/schem_4.png" alt="img">
                            <p>Производится доставка средств защиты для испытаний вы получаете пакет документов</p>
                        </li>
                        <li>
                            <img src="/image/catalog/schem_5.png" alt="img">
                            <p>В течении 5 дней производится испытание</br> СИЗ</p>
                        </li>
                        <li>
                            <img src="/image/catalog/schem_6.png" alt="img">
                            <p>Получаете заказ и все необходимые документы</p>
                        </li>
                    </ul>
                </div>
            </div>
<?php echo $footer; ?>