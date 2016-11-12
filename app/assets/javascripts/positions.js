$(document).on('change', '#position_status', function() {
  var value =  $('form select').find('#position_status').val();
  if(value =='disabled'){
    $('form').find('#user').hide();
    $('form').find('#deskcode').hide();
  }
  else if(value =='freespace'){
    $('form').find('#user').hide();
    $('form').find('#deskcode').hide();
  }
  else if(value =='freedesk'){
    $('form').find('#deskcode').show();
  }
  else{
    $('form').find('#user').show();
    $('form').find('#deskcode').show();
  }
});
