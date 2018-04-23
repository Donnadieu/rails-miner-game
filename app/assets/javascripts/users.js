$(document).ready(function() {
  $("#mining-rigs-button, #mining-rigs-header ").unbind("click").click(function(event) {
    event.preventDefault()
    var id = event.target.dataset.id
    var url = `/users/${id}/mining_rigs`

    $.get(url, function(response){
      debugger
    })
  })
})
