$(document).ready(function() {

  $("#mining-rigs-button, #mining-rigs-header ").unbind("click").click(function(event) {
    event.preventDefault()
    var userId = event.target.dataset.id
    var url = `/users/${userId}/mining_rigs.json`
    var authenticity_token = this.attributes.authenticity_token.value

    $.get(url, authenticity_token, function(miningRigs){
      $("#main").html(renderMiningRigIndex(userId))
      renderMiningRigs(miningRigs, authenticity_token)
    })
  })
})
