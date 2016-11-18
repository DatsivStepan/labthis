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
    
		<div class="cont_text fix_p cb mw clf" >
    
        <p class="baskt_art">ВАШ ЗАКАЗ</p>
    <div class="it_section_name bw clf">
                            <div class="sect_name clf">наименование</div>
                            <div class="sect_price clf">цена</div>
                            <div class="sect_keywrd clf">кол-во</div>
                            <div class="sect_sum clf">сумма</div>
                        </div>
        
			
					<div class="baskr_item_wr  mw clf" style="color: black;">	
					<% _.each(model.products, function(product) { %>
					
					<div class="baskr_item_box mw clf" <%= product.stock ? '' : 'class="stock"' %>>
        
        
                                
                                <div class="itm_img fl clf">
                                    <a href="<%= product.href %>">
                                        <img src="<%= product.thumb %>" alt="img" style="width: 55%;">
                                    </a>
                                </div>

                                <div class="itm_name fl clf">
                                    <a href="<%= product.href %>">
                                    <%= product.name %>
                                    </a>
                                </div>

                                <div class="itm_price fl clf" style="color: #2f0000;">
                                     <%= product.price %>
                                </div>

                                <div class="itm_nuumber fl clf">
                                    <div class="namber_box section number-plus-minus fr clf">
                                        <div class="jq-number">
                                        <div class="jq-number__field" style="    width: 90px; border: 0px!important;">
                        
                               	<span class="input-group-btn" style="    float: left;    width: 25px;">
									<button style="border: 1px solid #ccc;" class="btn btn-link decrease minus " data-product="<%= product.key %>">-</button>
								</span>            
								<input style="padding: 0px; float: left; border-top: 1px solid #dedddd !important;
    border-bottom: 1px solid #dedddd !important;    width: 30px; height: 24px;" min="1" type="text" data-mask="9?999999999999999" value="<%= product.quantity %>" class="qc-product-qantity form-control text-center" name="cart.<%= product.key %>"  data-refresh="2"/>
								<span class="input-group-btn" style="    float: left;    width: 25px;">
									<button style="border: 1px solid #ccc;" class="btn btn-link increase plus" data-product="<%= product.key %>"></button>
								
									
								</span>
                                        </div></div>
                                    </div>
                                </div>

                                <div class="itm_sum fl clf" style="color: #2f0000;">
                                    <%= product.total %>
                                </div>

                                <div class="close_box fr clf delete"> 
                                </div>
                            </div>
        
				
					
					 
					<% }) %>
					 </div>
              
              
              <div class="cont_text fix_p cb mw clf">
                        <!--Fast Order-->
                        <div class="urgently_order fl clf">
                            <p class="fl clf">Срочный заказ на испытания</p>
                            
                            
                            <div onclick="zakx2Function()" id="checklass" class="jq-checkbox cast_check fl clf" unselectable="on" style="-webkit-user-select: none; display: inline-block; position: relative; overflow: hidden;">
                            
                            <input  id="zakx2" name="confirm.agree" class="" type="checkbox"  value="1" style="position: absolute; z-index: -1; opacity: 0; margin: 0px; padding: 0px;">
                            
                            
                            
                            </div>
                        </div>

                        <!--Alert Info-->
                        <div class="alert_text_box cb fl clf">
                            <img src="image/varn.png" alt="img">
                              
				<% if( model.totals[2]['value'] < '5000'){ %>
			  
                        <p>При сумме заказа более <span>5000 руб.</span></p>
                       <p>«Бесплатная доставка»</p>
			    <% } %>
		        <% if( model.totals[2]['value'] > '5000' ){ %>
		                <p>При сумме заказа более <span>10000 руб.</span></p>
                       <p>«Бесплатный самовывоз, доставка»</p>
			
			    <% } %>
				<% if( model.totals[2]['value'] > '10000' ){ %>
			           <p>При сумме заказа более <span>100000 руб.</span></p>
                       <p>«Бесплатный самовывоз, доставка и скидка 5%»</p>
			    <% } %>
                            
                        </div>

                        <!--Total Price-->
                        <div class="total_bay_box fr clf">
                            <ul class="clf">
                                <li>Товаров на <span><%= model.totals[0]['value'] %> руб.</span></li>
                                <li id="srochzak" style="display:none;">Срочный заказ на испытания <span>Х2</span></li>
                                <li>Ваш подарок: <% if( (model.totals[2]['value'] > '5000') && (model.totals[2]['value'] < '10000') ){ %>
			
			 Бесплатная доставка
			<% } %>
			
				<% if( (model.totals[2]['value'] > '10000') && (model.totals[2]['value'] < '100000') ){ %>
			
			 Бесплатный самовывоз и доставка
			<% } %>		
			<% if( model.totals[2]['value'] >  '100000' ){ %>
			
			 Бесплатный самовывоз, доставка и скидка 5%
			<% } %></li>
                            </ul>

                            <p class="total_price fl clf">Итого: 
                              <span id="totalprise" value="<%= model.totals[2]['value'] %>">
               <%= model.totals[2]['value'] %> </span><span>руб.</span>
                           </p>
                        </div>

                    </div>
              
              
              
              
                 
	
		  
		
        
        
          
          
             
             
             
             
             
             
              
              </div> 

			
			</div> 
			
		
		</div>
	</div>
	
	<div class="split_bskt"></div>

</script>

<script>

   function zakx2Function() {
       if(document.getElementById("zakx2").checked == true) {document.getElementById("zakx2").checked = false;}else{
           document.getElementById("zakx2").checked = true;
       }
      
    var totalprise = document.getElementById('totalprise').innerHTML;
       var checet = document.getElementById("checklass").classList;
    if(document.getElementById("zakx2").checked == true) {
        
        checet.add("checked");
        
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
        checet.remove("checked");
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