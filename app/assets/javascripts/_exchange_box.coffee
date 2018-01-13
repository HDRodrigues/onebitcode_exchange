$(document).ready ->
  $('#quantity').change ->  
    postExchange()
    
  $('#currency').change ->
    postExchange()
  
  $('#currency_destination').change ->
    postExchange()

  postExchange = ->
    $.ajax '/exchange',
        type:'POST'
        dataType: 'json'
        data: {
                currency: $("#currency").val(),
                currency_destination: $('#currency_destination').val(),
                quantity: $('#quantity').val()
        }
        error:(jqXHR,textStatus,errorThrown) ->
          alert textStatus
        success:(data,text,jqXHR) ->
          $('#result').val(data.value)
          $('#result').value = data.value

  $('#invert_currency').click ->
    invertCurrencyValues()
    postExchange()
  
  invertCurrencyValues = ->
    currency = $('#currency').val()
    currency_destination = $('#currency_destination').val()
    $('#currency_destination').val(currency)
    $('#currency').val(currency_destination)

  
  

  
