$(document).ready(function() {
  $("#mining-rigs-button, #mining-rigs-header ").unbind("click").click((event) => {
    event.preventDefault()
    var id = event.target.dataset.id
    var url = `/users/${id}/mining_rigs`

    $.getJSON(url, function(data){
      // debugger
    })
  })
})
