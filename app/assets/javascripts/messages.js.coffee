$ ->
  alert("i'm here bitches")
  $("body").on 'click', '#modal_link', popModal
popModal = (event) ->
  event.preventDefault()
  alert("you clicked me…it felt so good")