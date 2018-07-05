function attachListeners() {
  $("#mining-rigs-button, #mining-rigs-header ").on('click', getMiningRigsIndex)
  $('#new_mining_rig').on('submit', createRig)
  $('#main').on('click', '#mining_rig_name', getMiners)
}
$(document).ready(function() {
  attachListeners()
})
