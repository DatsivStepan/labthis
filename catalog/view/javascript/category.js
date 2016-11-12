var cart_category = {
    'add': function(product_id) {
        var quantity = $("#product_"+product_id +" .jq-number__field input").val();
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                $('#cart > button').button('reset');

                if (json['redirect']) {
                    location = json['redirect'];
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
}
/*Range Slider*/
$(document).ready(function() {
    var snapSlider = document.getElementById('slider-range');

    noUiSlider.create(snapSlider, {
        start: [ 0, 7500 ],
        connect: true,
        range: {
            'min': 0,
            'max': 10000
        },
        format: wNumb({
            decimals: 0
        })
    });

    var snapValues = [
        document.getElementById('min_price'),
        document.getElementById('max_price')
    ];

    snapSlider.noUiSlider.on('update', function( values, handle ) {
        snapValues[handle].innerHTML = values[handle];
    });
});
