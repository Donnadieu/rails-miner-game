function attachListeners() {
  $("#mining-rigs-button, #mining-rigs-header ").unbind("click").click(() => getIndex(event))
  $('#new_mining_rig').unbind("submit").on('submit', () => createRig(event))
  $(document).unbind('click').on('click', '#mining_rig_name', () => getMiners(event))
}
$(document).ready(function() {
  attachListeners()
})
