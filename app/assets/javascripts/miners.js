$(document).unbind('click').on('click', '#mining_rig_name', function(event) {
  event.preventDefault()
  var  url = `${this.href}.json`

  $.get(url, function(response) {
    debugger
  })
})
})
