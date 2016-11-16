<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/confirm.tpl 
-->
<div id="confirm_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>" style="border-top: 1px solid #dedddd;"></div>
<script type="text/html" id="confirm_template">
<div id="confirm_wrap">
	<div class="">
		<div class="panel-body">
					<form  class="form-horizontal" novalidate="novalidate">
			<div class="container">
<div class="row"><h4 class="text-center"><b>ОФОРМЛЕНИЕ ЗАКАЗА</b></h4></div>
<div class="row">
     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
    <div class="row" style="    padding-top: 10px;   padding-bottom: 20px;"> <b>Контактная информация:</b> </div>
    <div class="row"> 
    <div id="shipping_address_firstname_input" class="text-input form-group  sort-item   required" data-sort="1">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_firstname"> 
			            <span class="text" title=""> Контактное лицо</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="firstname" id="shipping_address_firstname" value="" class="form-control  required firstname" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Имя должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Имя должно быть от 1 до 32 символов!">
			        </div>
	</div>
    <div id="shipping_address_email_input"     class="text-input form-group  sort-item   required" data-sort="2">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_email"> 
			            <span class="text" title=""> E-mail</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="emails" id="shipping_address_email" value="" class="form-control  required email" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="email должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="email должно быть от 1 до 32 символов!">
			        </div>
	</div>
    <div id="shipping_address_phone_input"     class="text-input form-group  sort-item   required" data-sort="3">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_phone"> 
			            <span class="text" title="">Телефон</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="phone" id="shipping_address_phone" value="" class="form-control  required phone" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Телефон должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Телефон должно быть от 1 до 32 символов!">
			        </div>
	</div>
    <div id="shipping_address_phone2_input"    class="text-input form-group  sort-item  " data-sort="4">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_phone2"> 
			            <span class="text" title="">Доп. телефон</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="phone2" id="shipping_address_phone2" value="" class="form-control  required phone2" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Доп. телефон должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Доп. телефон должно быть от 1 до 32 символов!">
			        </div>
	</div>
     
      
    </div>
    
    
    
     </div>
     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 " >
     <div class="row" style="    padding-top: 10px;   padding-bottom: 20px;"> <b>Способ доставки:</b> </div>
   <div class="row">
     <div id="divone" class="col-xs-5 col-sm-5 col-md-5 col-lg-5 text-center sposdost " onclick="divactiveone()">
     
     <div class="row"><img class="" src="./image/car.png"></div>
      <div class="row" style="padding-top: 15px;"><b>ДОСТАВКА</b></div>
     
     
     </div>
     <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
     <input type="text" name="sposdost" id="sposdost" value="САМОВЫВОЗ" class="hidden"> </div>
     <div id="divtoo" class="col-xs-5 col-sm-5 col-md-5 col-lg-5 text-center sposdost " onclick="divactivetoo()">
    <div class="row"><img class="" src="./image/shop.png"></div>
      <div class="row" style="padding-top: 15px;"><b>САМОВЫВОЗ</b></div>
    
    </div>
    </div>
    </div>
    
</div>
<div class="row">
     <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
          <div class="row" style="    padding-top: 10px;   padding-bottom: 20px;"> <b>Дополнительная информация:</b> </div>
          <div class="row"> 
         
          <div id="shipping_address_custom_field.address.6_input" class="text-input form-group  sort-item   " data-sort="1">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_custom_field.address.5"> 
			            <span class="text" title=""> Комментарий к заказу</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <textarea name="address5" id="shipping_address_custom_field.address.6" class="form-control validate textarea custom_field.address.5" autocomplite="on" placeholder=""></textarea>
			        </div>
			      </div>
          <div id="shipping_address_custom_field.address.6_input" class="text-input form-group  sort-item   " data-sort="2">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_custom_field.address.6"> 
			            <span class="text" title=""> Реквизиты<br>
(для юридического лица)</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <textarea name="address6" id="shipping_address_custom_field.address.6" class="form-control validate required textarea custom_field.address.6" autocomplite="on" placeholder=""></textarea>
			        </div>
			      </div>      
		 <div id="shipping_address_custom_field.address.4_input" class="text-input form-group  sort-item" data-sort="3">
			        <div class="col-xs-3">
			          
			        </div>
			        <div class="col-xs-8"> 
			          <input type="file" name="address4" id="shipping_address_custom_field.address.4" value="" class="" autocomplite="on" placeholder="">
			        </div>
			       </div>	     
          </div>
          
     </div>
     <div id="adresshide" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 hidden">
       <div class="row" style="    padding-top: 10px;   padding-bottom: 20px;"> <b>Адрес доставки::</b> </div>
    <div class="row"> 
    <div id="shipping_address_firstname_input" class="text-input form-group  sort-item   required" data-sort="1">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_firstname"> 
			            <span class="text" title=""> Город</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="gorod" id="shipping_address_firstname" value="" class="form-control  required firstname" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Имя должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Имя должно быть от 1 до 32 символов!">
			        </div>
	</div>
    <div id="shipping_address_email_input"     class="text-input form-group  sort-item   required" data-sort="2">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_email"> 
			            <span class="text" title=""> Улица</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="ylica" id="shipping_address_email" value="" class="form-control  required email" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="email должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="email должно быть от 1 до 32 символов!">
			        </div>
	</div>
    <div id="shipping_address_phone_input"     class="text-input form-group  sort-item   required" data-sort="3">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_phone"> 
			            <span class="text" title="">Дом</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="dom" id="shipping_address_phone" value="" class="form-control  required phone" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Телефон должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Телефон должно быть от 1 до 32 символов!">
			        </div>
	</div>
    <div id="shipping_address_phone2_input"    class="text-input form-group  sort-item   required" data-sort="4">
			        <div class="col-xs-3">
			          <label class="control-label" for="shipping_address_phone2"> 
			            <span class="text" title="">Квартира</span> 
			          </label>
			        </div>
			        <div class="col-xs-8"> 
			          <input type="text" name="kvar" id="shipping_address_phone2" value="" class="form-control  required phone2" autocomplite="on" placeholder="" data-rule-minlength="1" data-msg-minlength="Доп. телефон должно быть от 1 до 32 символов!" data-rule-maxlength="32" data-msg-maxlength="Доп. телефон должно быть от 1 до 32 символов!">
			        </div>
	</div>
     
      
    </div>
    </div>
    
</div>
</div>
</form>
			<form id="confirm_form" class="form-horizontal">
			</form>
			<div class="row" style="border-top: 1px solid #dedddd; padding-top: 20px;     margin-top: 20px; margin-bottom: 65px;">
			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 text-left">
			<button onclick="addorder()"  class="btn btn-link btn-lg btn-block" <%= model.show_confirm ? '' : 'disabled="disabled"' %> style="background-color: #0072b6; text-decoration: none; color: #ffffff;">Оформить заказ</span></button>
            </div></div>
		</div>
	</div>
</div>
</script>
<script>
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
    
$(function() {
	qc.confirm = $.extend(true, {}, new qc.Confirm(<?php echo $json; ?>));
	qc.confirmView = $.extend(true, {}, new qc.ConfirmView({
		el:$("#confirm_view"), 
		model: qc.confirm, 
		template: _.template($("#confirm_template").html())
	}));
});

</script>