// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require_tree .

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
MiningRig.prototype.renderSartMiningButton = function (authenticity_token) {
  return(`<form class="button_to" method="post" action="/mining_rig/${this.id}/miners"><input type="hidden" name="_method" value="patch"><input class="btn btn-primary btn-sm" type="submit" value="Start Mining"><input type="hidden" name="authenticity_token" value="${authenticity_token}"></form>`)
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
    var newRig = new MiningRig(miningRig.id, miningRig.name, miningRig.status, miningRig.miners, miningRig.user.id)

    $("#mining_rig_list").append(`
      <li class="mining_rig col-md-3" id="mining_rig_${newRig.id}">
        <div class="thumbnail" style="padding: 0">
          <div class="caption">
            ${newRig.renderName()}
            ${newRig.renderSartMiningButton(authenticity_token)}
            <small>(Mining time: 24hrs by default)</small>
          </div>
          <div class="modal-footer" style="text-align: center">
          ${newRig.renderInfo()}

        </div>
      </div>
    </li>`)
  })
}
