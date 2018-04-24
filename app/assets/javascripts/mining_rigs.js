$(function() {
  $('#new_mining_rig').unbind("submit").on('submit', function(event) {
    event.preventDefault()
    var url = this.attributes.action.value
    var data = {
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
