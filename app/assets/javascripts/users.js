$(document).ready(function() {

  function MiningRig(id, name, status, miners, userId) {
    this.id = id
    this.name = name
    this.status = status
    this.miners = miners
    this.userId = userId
  }
  MiningRig.prototype.renderName = function () {
    return(`<h2><a href="/users/${this.userId}/mining_rigs/${this.id}">${this.name}</a></h2>`)
  }
  MiningRig.prototype.renderSartMiningButton = function () {
    return(`<form class="button_to" method="post" action="/mining_rig/${this.id}/miners"><input type="hidden" name="_method" value="patch"><input class="btn btn-primary btn-sm" type="submit" value="Start Mining"><input type="hidden" name="authenticity_token" value="8iLjAQvDTSM/4pme3ZSun+ttZxiiLC+1xUAwEx7qaaIGW3DYsoyAiCe9tFK8pLO+5XlkKHGDVGZEZEAa80oqFw=="></form>`)
  }
  MiningRig.prototype.renderEditButton = function () {
    return(`<form class="button_to" method="get" action="/users/${this.userId}/mining_rigs/${this.id}/edit"><input class="btn btn-primary btn-sm" type="submit" value="Edit"></form>`)
  }
  MiningRig.prototype.renderInfo = function () {
    return(`<div class="row">
              <div class="col-md-4"><b>${this.miners.length}</b><br><small>Miners</small></div>
              <div class="col-md-4"><b>${this.totalConsumption()}W/Hr</b><br><small>Consumption</small></div>
              <div class="col-md-4"><b>${this.totalHashRate()}TH/s</b><br><small>Hashrate</small></div>
            </div>`)
  }
  MiningRig.prototype.totalConsumption = function () {
    var total = 0
    this.miners.forEach(function(miner) {
      total += parseFloat(miner.consumption)
    })
    return total
  }
  MiningRig.prototype.totalHashRate = function () {
    var total = 0
    this.miners.forEach(function(miner) {
      total += parseFloat(miner.hash_rate)
    })
    return total
  }
  function renderMiningRigIndex (userId) {
    return(`<div class="container">
              <div class="row">
                <ul class="thumbnails list-unstyled" id="mining_rig_list">
                </ul>
              </div>
            </div>
            <form class="button_to" method="get" action="/users/${userId}/mining_rigs/new"><input class="btn btn-success btn-lg" type="submit" value="New Mining Rig"></form>
          `)
  }

  $("#mining-rigs-button, #mining-rigs-header ").unbind("click").click(function(event) {
    event.preventDefault()
    var userId = event.target.dataset.id
    var url = `/users/${userId}/mining_rigs.json`

    $.get(url, function(response){
      $("#main").html(renderMiningRigIndex(userId))

      response.forEach(function(mining_rig) {
        var newRig = new MiningRig(mining_rig.id, mining_rig.name, mining_rig.status, mining_rig.miners, mining_rig.user.id)

        $("#mining_rig_list").append(`
          <li class="mining_rig col-md-3" id="mining_rig_${newRig.id}">
            <div class="thumbnail" style="padding: 0">
              <div class="caption">
                ${newRig.renderName()}
                ${newRig.renderSartMiningButton()}
                <small>(Mining time: 24hrs by default)</small>
              </div>
              <div class="modal-footer" style="text-align: center">
              ${newRig.renderInfo()}

            </div>
          </div>
        </li>`)
      })
    })
  })
})
