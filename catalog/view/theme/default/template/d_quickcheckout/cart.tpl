<div id="cart_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="cart_template">
  <div class="back_box_wr mw clf">
            <a class="hb dmcart" href="index.php?route=product/category&path=75">Вернуться в каталог</a>
        </div>
	<div class="chekoutdiv <%= model.config.display ? '' : 'hidden' %>">
	<!-- 	<div class="panel-heading">
			<h4 class="panel-title">
				<span class="icon">
					<i class="<%= model.config.icon %>"></i>
				</span>
				<span class="text"><%= model.config.title %> <%= (model.cart_weight) ? '('+model.cart_weight+')' : '' %></span>
			</h4>
		</div>
-->
    
		<div class="qc-checkout-product panel-body" >
			<p class="text"><%= model.config.description %></p>
			<% if(model.error){ %>
				<div class="alert alert-danger">
					<i class="fa fa-exclamation-circle"></i> <%= model.error %>
				</div>
			<% } %>
                    
      
        <div class="row"><h3 class="row text-center"><b style="color: #000000;">ВАШ ЗАКАЗ</b></h3></div>
        <div class="row chekouttovarheder">
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"></div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 text-center">наименование</div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">цена</div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">кол-во</div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">сумма</div>
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
        </div>
        
			
						
					<% _.each(model.products, function(product) { %>
					
					<div class="row chekouttovar" <%= product.stock ? '' : 'class="stock"' %>>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 chekouttovarline">
								<img class="chekouttovarimg" src="<%= product.thumb %>" class="img-responsive"/>
							</div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 chekouttovarline text-center">	
        <a href="<%= product.href %>" <%=  model.config.columns.image ? '' : 'rel="popup" data-help=\'<img src="' + product.image + '"/>\'' %>> 
								<%= product.name %> <%= product.stock ? '' : '<span class="out-of-stock">***</span>' %>
							</a>
							<% _.each(product.option, function(option) { %>
								<div> &nbsp;<small> - <%= option.name %>: <%= option.value %></small> </div>
							<% }) %>
						
							<% if(parseInt(model.config.columns.price) && model.show_price){ %>
								<div class="qc-name-price visible-xs-block "><small><span class="title"><?php echo $column_price; ?>:</span> <span class="text"><%= product.price %></span></small></div>
							<% } %>
							
							</div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 chekouttovarline text-center"><b><span class="text"><%= product.price %></span></b></div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 chekouttovarline" style="padding: 30px;">
        
   
								<span class="input-group-btn" style="    float: left;    width: 30px;">
									<button style="border: 1px solid #ccc;" class="btn btn-link decrease hidden-xs" data-product="<%= product.key %>">-</button>
								</span>            
								<input style="    float: left;    width: 50px; border-radius: 0;" type="text" data-mask="9?999999999999999" value="<%= product.quantity %>" class="qc-product-qantity form-control text-center" name="cart.<%= product.key %>"  data-refresh="2"/>
								<span class="input-group-btn" style="    float: left;    width: 20px;">
									<button style="border: 1px solid #ccc;" class="btn btn-link increase hidden-xs" data-product="<%= product.key %>">+</button>
								
									
								</span>
							</div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 chekouttovarline text-center"><b><%= product.total %></b></div>
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 chekouttovarline"><button class="btn btn-link delete hidden-xs" data-product="<%= product.key %>"><i class="fa fa-times"></i></button></div>
				
					</div>
					 
					<% }) %>
					
               <div class="row" style="padding-top: 10px; padding-bottom: 10px;">
                   Срочный заказ на испытания 
                   <input onclick="zakx2Function()" id="zakx2" class="checart" type="checkbox" name="confirm.agree" id="confirm_agree" class="validate required" required="" value="1">
               </div>      
		<div class="row">	
		<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 infoskud">
            <span>!</span>
				<% if( model.totals[2]['value'] < '5000'){ %>
			  Сделав заказ на сумму более 5000 вы получите доставку в подарок
			    <% } %>
		        <% if( model.totals[2]['value'] > '5000' ){ %>
			 Сделав заказ на сумму более 10000 вы получите самовывоз и  доставку в подарок
			    <% } %>
				<% if( model.totals[2]['value'] > '10000' ){ %>
			 Сделав заказ на сумму более 100000 вы получите скидку 5%
			    <% } %>
		
		  </div> 
		   <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"> </div>
		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            <div class="row">Товаров на <b><%= model.totals[0]['value'] %></b> </div> 
            <div class="row" id="srochzak" style="display:none;">Срочный заказ на испытания <b>Х2</b> </div> 
            <div class="row">Ваш подарок: 
		<% if( (model.totals[2]['value'] > '5000') && (model.totals[2]['value'] < '10000') ){ %>
			
			 Бесплатная доставка
			<% } %>
			
				<% if( (model.totals[2]['value'] > '10000') && (model.totals[2]['value'] < '100000') ){ %>
			
			 Бесплатный самовывоз и доставка
			<% } %>		
			<% if( model.totals[2]['value'] >  '100000' ){ %>
			
			 Бесплатный самовывоз, доставка и скидка 5%
			<% } %>
            </div> 
            <div class="row" style="padding-top: 10px; padding-bottom: 10px;"><span style="font-size: 140%;">Итого:</span> <span id="totalprise" value="<%= model.totals[2]['value'] %>" style="font-size: 140%;     color: #0072b6;"><%= model.totals[2]['value'] %></span><span style="font-size: 140%;     color: #0072b6;"> руб.</span> </div> 
              </div> 

			
			</div> 
			<div class="preloader row"><img class="icon" src="image/<%= config.general.loader %>" /></div>
		
		</div>
	</div>

</script>

<script>

   function zakx2Function() {
    var totalprise = document.getElementById('totalprise').innerHTML;
    if(document.getElementById("zakx2").checked == true) {
        totalprise=totalprise*2;
        var array = {
                'status' : '1'
			};
        	$.ajax({
			url: 'index.php?route=d_quickcheckout/confirm/xtooprice',
			type: 'post',
			data: array,
			dataType: 'json'		
			
		}).fail(function(data) {
               console.log(data);
				}).done(function(data) {
				//location.reload();
               console.log(data);
				});
       document.getElementById('srochzak').style.display = 'block';
    }
    if(document.getElementById("zakx2").checked == false){
        totalprise=totalprise/2;
           var array = {
                'status' : '0'
			};
        	$.ajax({
			url: 'index.php?route=d_quickcheckout/confirm/xtooprice',
			type: 'post',
			data: array,
			dataType: 'json'		
			
		}).fail(function(data) {
               console.log(data);
				}).done(function(data) {
				//location.reload();
                console.log(data);
				});
        document.getElementById('srochzak').style.display = 'none';
    }
      document.getElementById('totalprise').innerHTML = totalprise;
       
}

      
$(function() {
	qc.cart = $.extend(true, {}, new qc.Cart(<?php echo $json; ?>));
	qc.cartView = $.extend(true, {}, new qc.CartView({
		el:$("#cart_view"), 
		model: qc.cart, 
		template: _.template($("#cart_template").html())
	}));

});

</script>