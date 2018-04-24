class Miner {
  constructor(id, consumption, hash_rate, status, brand){
    this.id = id
    this.consumption = consumption
    this.hash_rate = hash_rate
    this.status = status
    this.brand = brand
  }

  renderId(){
    return(`<h3>Miner ID: ${this.id}</h3>`)
  }
  renderInfo(){
    return(`
      <p>Miner Consumption: ${this.consumption}W</p>
      <p>Miner Hash Rate: ${this.hash_rate}TH/s</p>
      <p>Miner Brand: ${this.brand}</p>
      `)
  }
}

function renderMinerIndex() {
  return(`<legend><strong>New rig</strong></legend>
          <div class="container">
            <div class="row">
              <ul id="miners_list" class="thumbnails list-unstyled">
              </ul>
            </div>
          </div>`)
}

$(document).unbind('click').on('click', '#mining_rig_name', function(event) {
  event.preventDefault()
  const  url = `${this.href}.json`

  $.get(url, function(miners) {
    $('#main').html(renderMinerIndex())

    miners.forEach(function(miner) {
      const newMiner = new Miner(miner.id, miner.consumption, miner.hash_rate, miner.status, miner.mining_rig_miners[0].brand)

      $('#miners_list').append(`
        <li class="mining_rig_miner col-md-3" id="mining_rig_miner_${newMiner.id}">
          <div class="thumbnail" style="padding: 0">
            <div class="caption" id="miner">
              ${newMiner.renderId()}
            </div>
            <div class="modal-footer" style="text-align: center">
              <div class="row">
                ${newMiner.renderInfo()}
              </div>
            </div>
          </div>
        </li>`)
    })
  })
})
