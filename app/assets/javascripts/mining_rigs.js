function MiningRig(id, name, status, miners, userId) {
  this.id = id
  this.name = name
  this.status = status
  this.miners = miners
  this.userId = userId
}
MiningRig.prototype.renderName = function () {
  return(`<h2><a id="mining_rig_name" href="/users/${this.userId}/mining_rigs/${this.id}">${this.name}</a></h2>`)
}
MiningRig.prototype.renderSartMiningButton = function (authenticity_token) {
  if (!this.status) {
    return(`<form class="button_to" method="post" action="/mining_rig/${this.id}/miners"><input type="hidden" name="_method" value="patch"><input class="btn btn-primary btn-sm" type="submit" value="Start Mining"><input type="hidden" name="authenticity_token" value="${authenticity_token}"></form>
            <small>(Mining time: 24hrs by default)</small>
          `)
  } else {
    return(`<p>Mining Rig currently mining...</p>`)
  }
}
MiningRig.prototype.renderEditButton = function () {
  return(`<form class="button_to" method="get" action="/users/${this.userId}/mining_rigs/${this.id}/edit"><input class="btn btn-primary btn-sm" type="submit" value="Edit"></form>`)
}
MiningRig.prototype.renderInfo = function () {
  return(`<div class="row">
            <div class="col-md-4"><b>${this.miners.length}</b><br><small>Miners</small></div>
            <div class="col-md-4"><b>${this.totalConsumption()}W/Hr</b><br><small>Consumption</small></div>
            <div class="col-md-4"><b>${this.totalHashRate()}.0TH/s</b><br><small>Hashrate</small></div>
          </div>`)
}
MiningRig.prototype.totalConsumption = function () {
  let total = 0
  this.miners.forEach(function(miner) {
    total += parseFloat(miner.consumption)
  })
  return total
}
MiningRig.prototype.totalHashRate = function () {
  let total = 0
  this.miners.forEach(function(miner) {
    total += parseFloat(miner.hash_rate)
  })
  return total
}
function renderMiningRigIndex (userId) {
  return(`<div class="container">
            <form class="button_to" method="get" action="/users/${userId}/mining_rigs/new"><input class="btn btn-success btn-lg" type="submit" value="New Mining Rig"></form>
            <br></br>
            <div class="row">
              <ul class="thumbnails list-unstyled" id="mining_rig_list">
              </ul>
            </div>
          </div>
        `)
}

function renderMiningRigs(miningRigs, authenticity_token) {
  miningRigs.forEach(function(miningRig) {
    const newRig = new MiningRig(miningRig.id, miningRig.name, miningRig.status, miningRig.miners, miningRig.user.id)

    $("#mining_rig_list").append(`
      <li class="mining_rig col-md-3" id="mining_rig_${newRig.id}">
        <div class="thumbnail" style="padding: 0">
          <div class="caption">
            ${newRig.renderName()}
            ${newRig.renderSartMiningButton(authenticity_token)}
          </div>
          <div class="modal-footer" style="text-align: center">
          ${newRig.renderInfo()}
          ${newRig.renderEditButton()}
        </div>
      </div>
    </li>`)
  })
}
$(function() {
  $('#new_mining_rig').unbind("submit").on('submit', function(event) {
    event.preventDefault()
    const url = this.attributes.action.value
    const data = {
      'authenticity_token': this.elements['authenticity_token'].value,
      'mining_rig': {
        'name': $('#mining_rig_name').val(),
        'mining_rig_miners_attributes': {
          '0':{
            'hash_rate': $('#mining_rig_mining_rig_miners_attributes_0_hash_rate').val(),
            'brand': $('#mining_rig_mining_rig_miners_attributes_0_brand').val()
          }
        }
      }
    }
    $.post(url, data, function(miningRigs) {
      $("#main").html(renderMiningRigIndex(miningRigs[0].user.id))
      renderMiningRigs(miningRigs)
    })
  })
})
