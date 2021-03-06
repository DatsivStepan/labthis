<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/cart.tpl 
-->

<script type="text/html" id="payment_template">
<% if(Number(model.payment_payment_popup)) {%>
	
<div class="modal fade" id="payment_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><span class="text"><%= model.payment_payment_title %></span></h4>
			</div>
			<div class="modal-body clearfix">
				<% if(model.payment){ %>
					<%= model.payment %>
				<% } %>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<% }else{ %>
	<% if(model.payment){ %>
		<%= model.payment %>
	<% } %>
<% } %>
</script>
<script>

$(function() {
	qc.payment = $.extend(true, {}, new qc.Payment(<?php echo $json; ?>));
	qc.paymentView = $.extend(true, {}, new qc.PaymentView({
		el:$("#payment_view"), 
		model: qc.payment, 
		template: _.template($("#payment_template").html())
	}));

});

</script>

