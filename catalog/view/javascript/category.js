var cart_category = {
    'add': function(product_id) {
        var quantity = $("#product_"+product_id +" .jq-number__field input").val();
        var productOption = $('.product_option_'+product_id+' input[type=\'checkbox\']:checked');        
        console.log(productOption);
        
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            //data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1)+'&option='+productOption,
            data: $('#product_'+product_id+' input[type=\'text\'], #product_'+product_id+' input[type=\'hidden\'], #product_'+product_id+' input[type=\'radio\']:checked, #product_'+product_id+' input[type=\'checkbox\']:checked,  #product_'+product_id+' input[name=\'quantity\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                $('#cart > button').button('reset');

                if (json['redirect']) {
                    alert('dvd');
                    //location = json['redirect'];
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    console.log(json);
                    $('#cart-total').html(json['total']);

                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }
            }
        });
    }
    
};

$(document).on('change','.checkLabIsputC',function(){
    var product_id = $(this).data('product_id');
    if($(this).is(':checked')){
        var OptionValue = parseInt($('#product_'+product_id).find('.hiddenOprionValue').val());
        var productPrice = parseInt($('#product_'+product_id).find('.productOldPrice').val());
        var productQuantity = parseInt($('#product_'+product_id).find('input[name=quantity]').val());
        var TotalPrice = (productPrice * productQuantity) + (OptionValue * productQuantity);
        $('#product_'+product_id).find('.productPriceView').text(TotalPrice+'р.');
    }else{
        var productPrice = parseInt($('#product_'+product_id).find('.productOldPrice').val());
        var productQuantity = parseInt($('#product_'+product_id).find('input[name=quantity]').val());
        var TotalPrice = productPrice * productQuantity;
        $('#product_'+product_id).find('.productPriceView').text(TotalPrice+'p.');
    }
});

$(document).on('click','.quickOrder',function(){
    $('#button-cart').trigger('click');
    setTimeout(function(){
        document.location = '/index.php?route=checkout/checkout';
    }, 1000);
})
$(document).on('click','.quantityContainer .plus, .quantityContainer .minus',function(){
    var productQuantity = $(this).parent().find('input[name=quantity]').val();
    var product_id = $(this).parent().find('input[name=quantity]').data('product_id');
    if($('#product_'+product_id).find('.checkLabIsputC').is(':checked')){
        var OptionValue = parseInt($('#product_'+product_id).find('.hiddenOprionValue').val());
        var productPrice = parseInt($('#product_'+product_id).find('.productOldPrice').val());
        var productQuantity = parseInt($('#product_'+product_id).find('input[name=quantity]').val());
        var TotalPrice = (productPrice * productQuantity) + (OptionValue * productQuantity);
        $('#product_'+product_id).find('.productPriceView').text(TotalPrice+'р.');
    }else{
        var productPrice = parseInt($('#product_'+product_id).find('.productOldPrice').val());
        var productQuantity = parseInt($('#product_'+product_id).find('input[name=quantity]').val());
        var TotalPrice = productPrice * productQuantity;
        $('#product_'+product_id).find('.productPriceView').text(TotalPrice+'р.');
    }
    //$('#product_'+product_id).find('.productPriceView').text(TotalPrice+'р.');
})