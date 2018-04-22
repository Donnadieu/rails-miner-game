$(document).ready(function() {
  $("#mining-rigs-button, #mining-rigs-header ").unbind("click").click((event) => {
    event.preventDefault()
    alert("You clicked")
  })
})
