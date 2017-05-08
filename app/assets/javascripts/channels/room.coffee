App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append data['message']
    $('#messages').animate({ scrollTop: $('#messages')[0].scrollHeight }, "fast")

  speak: (message) ->
    @perform 'speak', message: message
    
$(document).on 'keypress', '#chat_field', (event) ->
  if event.keyCode is 13 # enter
    $text = event.target.value
    if $text isnt ''
      $.ajax '/translate/'+$text,
        type: 'GET'
        dataType: 'html'
        success: (data) ->
          $a = $(data).filter("table").find("p")
          App.room.speak $a.text()
        error: ->
          alert("Translation Error")
    event.target.value = ''
    event.preventDefault()