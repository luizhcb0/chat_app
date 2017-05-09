# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('#messages').animate({ scrollTop: $('#messages')[0].scrollHeight }, "fast")
  do getOnlineUsers
  setInterval ->
    do getOnlineUsers
  , 10000

appendUser = (user) ->
  if user["online"]
    $('.online').append('<div class="user"><div class="online_signal"><div class="green"></div></div><div class="online_name">'+user['name']+'</div></div>')
  else
    $('.online').append('<div class="user"><div class="online_signal"><div class="red"></div></div><div class="online_name">'+user['name']+'</div></div>')


cleanList = (users) ->
  $('.online').html("")
  appendUser user for user in users
  
  
getOnlineUsers = ->
  $.ajax '/online_users/',
    type: 'GET'
    dataType: 'json'
    success: (data) ->
      cleanList data
    error: ->