<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/confirm.tpl 
-->
<div id="confirm_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="confirm_template">
		<div class="panel-body cont_text fix_p fl mw clf">
					<form name="form" class="form-horizontal" novalidate="novalidate" style="color: black;">

<p class="baskt_art">ОФОРМЛЕНИЕ ЗАКАЗА</p>
<div class="form_wr mw cb clf">
     <div class="form_box_wr fl clf">
    <h4 style="    margin: 0px 0 34px 0;
    font: 14px 'nsb';">Контактная информация:</h4>
    <div class="form_box fl clf"> 
    <div id="shipping_address_firstname_input" class="form_cont mw clf" data-sort="1">
			        
			          <label class="" for="shipping_address_firstname"> 
			             Контактное лицо
			          </label>
			          <span style="color:red" id="firstnamef"></span>
			          <input type="text" name="firstname" id="shipping_address_firstname" value="" class="" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Имя должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Имя должно быть от 1 до 32 символов!">
			          
			       
	</div>
    <div id="shipping_address_email_input"     class="form_cont mw clf" data-sort="2">
			        
			          <label class="" for="shipping_address_email"> 
			            <span class="text" title=""> E-mail</span> 
			          </label>
			        <span style="color:red" id="emailsf"></span>
			          <input type="text" name="emails" id="shipping_address_email" value="" class="" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="email должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="email должно быть от 1 до 32 символов!">
			       
	</div>
    <div id="shipping_address_phone_input"     class="form_cont mw clf" data-sort="3">
			       
			          <label class="" for="shipping_address_phone"> 
			            <span class="text" title="">Телефон</span> 
			          </label>
			        <span style="color:red" id="phonef"></span> 
			          <input type="text" name="phone" id="shipping_address_phone" value="" class="" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Телефон должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Телефон должно быть от 1 до 32 символов!">
			       
	</div>
    <div id="shipping_address_phone2_input"    class="form_cont dot_f mw clf" data-sort="4">
			     
			          <label class="" for="shipping_address_phone2"> 
			            <span class="text" title="">Доп. телефон</span> 
			          </label>
			       
			          <input type="text" name="phone2" id="shipping_address_phone2" value="" class="" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Доп. телефон должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Доп. телефон должно быть от 1 до 32 символов!">
			        
	</div>
     
      
    </div>
    
    
    
     </div>
     <div class="form_box_wr fix_btn fr clf" >
     <h4>Способ доставки:</h4>
  
      <div class="form_box fl clf">
                                    <button id="divone" onclick="divactiveone()" class="delivery_btn hb fl clf">
                                        <span>Доставка</span>
                                    </button>
                                    <button id="divtoo" class="pickup_btn hb fr clf" onclick="divactivetoo()">
                                        <span>самовывоз</span>
                                    </button> 
                                    <input type="text" name="sposdost" id="sposdost" value="САМОВЫВОЗ" class="hidden"> 
                                    
                                    </div>     
                                </div>
    
    
  

  
   
    </div>
    


     <div class="form_wr mw cb clf">
  
          <div class="form_box_wr dot_f fl clf">
          <h4>Дополнительная информация:</h4>
          <div class="form_box fl clf"> 
         
          <div id="shipping_address_custom_field.address.6_input" class="form_cont tar_f mw clf" >
			       
			          <label class="" for="shipping_address_custom_field.address.5">Комментарий к заказу</label>
			       
			          <textarea name="address5" id="shipping_address_custom_field.address.6" class="" autocomplite="on" placeholder=""></textarea>
			       
			      </div>
          <div id="shipping_address_custom_field.address.6_input" class="form_cont dot_f tar_f mw clf" >
			        
			          <label class="" for="shipping_address_custom_field.address.6">Реквизиты<br>(для юридического лица)
			          </label>
			          <textarea name="address6" id="shipping_address_custom_field.address.6" class="" autocomplite="on" placeholder=""></textarea>
			       
			      </div>      
		 <div id="shipping_address_custom_field.address.4_input" class="load_file_box fr clf">
			     
                <div class="jq-file" style="display: inline-block; position: relative; overflow: hidden;">
                <input name="address4" type="file" style="position: absolute; top: 0px; right: 0px; margin: 0px; padding: 0px; opacity: 0; font-size: 100px;"></div>
                
                
                
			       
                 
			        
			          
          </div> </div>
          
     </div>
     
      <div id="adresshide" class="form_box_wr fr clf hidden">
      
     <h4>Адрес доставки:</h4>
    <div class="form_box fl clf"> 
    
     <div class="form_cont mw clf">
         <label>Город</label><span style="color:red" id="gorodf"></span><input name="gorod" type="text" placeholder="Москва" name="" value="">
                                    </div>
                                    <div class="form_cont mw clf">
                                        <label>Улица</label><span style="color:red" id="ylicaf"></span><input name="ylica" type="text" name="" value="">
                                    </div>
                                    <div class="form_cont mw clf">
                                        <label>Дом</label><span style="color:red" id="domf"></span><input  name="dom" type="text" name="" value="">
                                    </div>
                                    <div class="form_cont mw clf">
                                        <label>Квартира</label><input name="kvar" type="text" name="" value="">
                                    </div>
    
       
    </div>
    </div>
    
</div>
</form>
 <div class="row"></div>
                    <div class="split_bskt"></div>

                        <button onclick="addorder()" class="bay_btn hb mw clf" href="#" tabindex="0">Оформить заказ</button>
</div>
                  
			
			
            


</script>
<script>
    function fileup(){
        console.log(document.getElementById('filef').value);
   document.getElementById('filef').innerHTML='файл загружен'; 
    }
   function divactiveone(){
        document.getElementById('sposdost').value = 'ДОСТАВКА';
      var one = document.getElementById("divone").classList;
      var too = document.getElementById("divtoo").classList;
      var adresshide = document.getElementById("adresshide").classList;

 if (one.contains("blueact")) {

 } else {
 
    one.add("blueact");
    adresshide.remove("hidden");
    
 
 }
       too.remove("blueact");}
    
   function divactivetoo(){
       document.getElementById('sposdost').value = 'САМОВЫВОЗ';
    var one = document.getElementById("divone").classList;
      var too = document.getElementById("divtoo").classList;
       var adresshide = document.getElementById("adresshide").classList;
 if (too.contains("blueact")) {
  
 } else {
 
    too.add("blueact");
    one.remove("blueact");
 adresshide.add("hidden");}
 }
    
     function addorder() {
   var prov = 0;    
   var firstname=document.forms["form"]["firstname"].value;
   var emails=document.forms["form"]["emails"].value;
   var phone=document.forms["form"]["phone"].value;
   var gorod=document.forms["form"]["gorod"].value;
   var ylica=document.forms["form"]["ylica"].value;
   var dom=document.forms["form"]["dom"].value;
  
   if (firstname.length==0){
      document.getElementById("firstnamef").innerHTML="*данное поле обязательно длязаполнения";
      prov = 1;
   }
   if (emails.length==0){
      document.getElementById("emailsf").innerHTML="*данное поле обязательно для заполнения";
      prov = 1;
   }
         if (phone.length==0){
      document.getElementById("phonef").innerHTML="*данное поле обязательно для заполнения";
      prov = 1;
   }
         if (document.getElementById('sposdost').value == 'ДОСТАВКА'){
         if (gorod.length==0){
      document.getElementById("gorodf").innerHTML="*данное поле обязательно для заполнения";
      prov = 1;
   }
         if (ylica.length==0){
      document.getElementById("ylicaf").innerHTML="*данное поле обязательно для заполнения";
      prov = 1;
   }
         if (dom.length==0){
      document.getElementById("domf").innerHTML="*данное поле обязательно для заполнения";
      prov = 1;
   }
             }
         
         if (prov == 0){
       var sposdost = 1;
    var array = {
				'contactname': $('input[name=firstname]').val(),
                'zakx2': document.getElementById('zakx2').checked,
                'email': $('input[name=emails]').val(),
                'phone': $('input[name=phone]').val(),
                'phone2': $('input[name=phone2]').val(),
                'com': $('textarea[name=address5]').val(),
                'rekviz': $('textarea[name=address6]').val(),
                'rekvizup': $('input[name=address4]').val(),
                'sposdost': $('input[name=sposdost]').val(),
                'gorod': $('input[name=gorod]').val(),
                'ylica': $('input[name=ylica]').val(),
				'dom' : $('input[name=dom]').val(),
                'kvar' : $('input[name=kvar]').val()
			};
	$.ajax({
			url: 'index.php?route=d_quickcheckout/confirm/updateOrderAll',
			type: 'post',
			data: array,
			dataType: 'json'		
			
		}).fail(function(data) {
               console.log(data);
				}).done(function(data) {
				window.location = "index.php?route=checkout/success";
				});
    
     }
     }
    
$(function() {
	qc.confirm = $.extend(true, {}, new qc.Confirm(<?php echo $json; ?>));
	qc.confirmView = $.extend(true, {}, new qc.ConfirmView({
		el:$("#confirm_view"), 
		model: qc.confirm, 
		template: _.template($("#confirm_template").html())
	}));
});

    
    $(document).ready(function() {
	/*Main SL*/
  $('.main_sl_box').slick({
  	  autoplay: true,
  	  autoplaySpeed: 2990,
  	  pauseOnHover: true,
  	  dots: true,
  	  arrows: true,
	  infinite: true,
	  speed: 300
  });
  /*Item SL*/
  $('.product_sl').slick({
  	  autoplay: true,
  	  autoplaySpeed: 2990,
  	  pauseOnHover: true,
  	  dots: true,
  	  arrows: false,
	  infinite: true,
	  speed: 300
  });

  $('.item_sl').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  fade: false,
	  asNavFor: '.item_sl_nav'
  });
  $('.item_sl_nav').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  asNavFor: '.item_sl',
	  dots: false,
	  centerMode: false,
	  focusOnSelect: true
  });

  /*Inpeut Namb*/
  $('.namber_box input').styler();

  /*Clear Inpu Placeholder*/
  $('input,textarea').focus(function(){
   $(this).data('placeholder',$(this).attr('placeholder'))
   $(this).attr('placeholder','');
 });
 $('input,textarea').blur(function(){
   $(this).attr('placeholder',$(this).data('placeholder'));
 });

  /*File Style*/	
  $('.load_file_box input, .cast_check').styler();

  /*Add/Remo Class*/
	$('.form_box button').click(function(e) {
		
		var tg = e.target || e.srcElement;
		var lv = $('.form_box');
		var x = lv.find('button');
		var stl = $(tg).hasClass('act_btn');

		for (var i = 0; i < x.length; i++) {
			a = x[i];
		}

		if (a = tg) {
			var foo = function() {
				console.log(tg);
				if ( stl != true ) {
					var rem = function() {
						$('.form_box button').removeClass('act_btn'),
						$(tg).addClass('act_btn')
					}
					rem();
				} else {
					$(tg).removeClass('act_btn');
				}
			}
			foo();
		}
        return false;

	});

	/*Basket Remove Item*/
	$('.close_box').click(function() {
        $(this).parents(".baskr_item_box").slideUp(500,
        	function(){$(this).remove();
        });	
    });
        
});


</script>
