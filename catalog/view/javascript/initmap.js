function initMap(address) {
        var myLatLng = {lat: 40.5212813, lng: -107.7129514};
        var my_location_lat;
        var my_location_lng;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 6,
          center: myLatLng
        });
    if(address != ''){
        var geocoder = new google.maps.Geocoder();
        //var address = $(this).val();
            geocoder.geocode({'address': address}, function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                var Local = results[0].geometry.location;
                var latLng = {lat:parseFloat(Local.lat()),lng:parseFloat(Local.lng())};
                    var icon = {
                        url:'../../../image/catalog/ico/map_ico.png',
                        scaledSize: new google.maps.Size(40,45)
                    };
                  var marker = new google.maps.Marker({
                    position: latLng,
                    zoom:6,
                    icon: icon,
                    map: map,
                 //   title: 'Hello World!'
                  });
                  map.setCenter(latLng);
                  map.setZoom(14);
            }else{
                alert('error');
            }
        });
    }
    
} 


$(document).ready(function(){
    initMap($('.shopAddress').text());
});
$(document).on('click','.showA',function(){
});

