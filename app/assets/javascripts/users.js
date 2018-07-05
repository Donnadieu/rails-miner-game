function attachListeners() {
  $("#mining-rigs-button, #mining-rigs-header ").on('click', getMiningRigsIndex)
  $('#new_mining_rig').on('submit', createRig)
  $('#mining_rig_name').on('click', getMiners)
}
$(document).ready(function() {
  attachListeners()
})
