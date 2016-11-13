$(document).ready(function(){
  $(document).on('submit','#formContact',function (e) {
    e.preventDefault();
    $.ajax({
        type:'post',//тип запроса: get,post либо head
        url: $(this).attr( 'action' ),//url адрес файла обработчика
        data:$( this ).serialize(),//параметры запроса
        response:'text',//тип возвращаемого ответа text либо xml
        success:function (data) {//возвращаемый результат от сервера
          var resp = $(data)
          if(resp.find('#formContact').length){
            $('.fcont').html(resp.find('#formContact'))
          }else {
            $('.fcont').html(data)
          }
        }
    });

  })
});
