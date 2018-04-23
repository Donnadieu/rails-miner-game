$(document).ready(function() {
  $("#mining-rigs-button, #mining-rigs-header ").unbind("click").click(function(event) {
    event.preventDefault()
    var id = event.target.dataset.id
    var url = `/users/${id}/mining_rigs.json`

    $.get(url, function(response){
      $("#main").html(renderMiningRigIndex(id))

      response.forEach(function(mining_rig) {
        // const newRig = new MiningRig()
        debugger
        $("#mining_rig_list").append(`
          <li class="mining_rig col-md-3" id="mining_rig_${mining_rig.id}">
            <div class="thumbnail" style="padding: 0">
              <div class="caption">
                <h2><a href="/users/1/mining_rigs/7">gukhgkgh</a></h2>
                <form class="button_to" method="post" action="/mining_rig/7/miners"><input type="hidden" name="_method" value="patch"><input class="btn btn-primary btn-sm" type="submit" value="Start Mining"><input type="hidden" name="authenticity_token" value="8iLjAQvDTSM/4pme3ZSun+ttZxiiLC+1xUAwEx7qaaIGW3DYsoyAiCe9tFK8pLO+5XlkKHGDVGZEZEAa80oqFw=="></form>
                <small>(Mining time: 24hrs by default)</small>
              </div>
              <div class="modal-footer" style="text-align: center">
              <div class="row">
                <div class="col-md-4"><b>1</b><br><small>Miners</small></div>
                <div class="col-md-4"><b>2600.0W/Hr</b><br><small>Consumption</small></div>
                <div class="col-md-4"><b>56.0TH/s</b><br><small>Hashrate</small></div>
              </div>
              <form class="button_to" method="get" action="/users/1/mining_rigs/7/edit"><input class="btn btn-primary btn-sm" type="submit" value="Edit"></form>
            </div>
          </div>
        </li>`)
      })
    })
  })
  function renderMiningRigIndex(id) {
    return(`<div class="container">
              <div class="row">
                <ul class="thumbnails list-unstyled" id="mining_rig_list">
                </ul>
              </div>
            </div>
            <form class="button_to" method="get" action="/users/${id}/mining_rigs/new"><input class="btn btn-success btn-lg" type="submit" value="New Mining Rig"></form>
          `)
  }
})

// function MiningRig(name, status, miners) {
//   this.name = name
//   this.status = status
//   this.miners = miners
//
// }
// MiningRig.prototype.renderName = function () {
//   return
// }
