$ ->
  $("#modal_link").on 'click', popModal
popModal = (event) ->
  event.preventDefault()
  $("#modal_fun").modal({overlayClose:true})