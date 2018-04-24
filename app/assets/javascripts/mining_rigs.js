$(function() {
  $('#new_mining_rig').unbind("submit").on('submit', function(event) {
    // event.preventDefault()

    var data = {
      'authenticity_token': 'RnpPAaQYaOJMbZAR9cUocjVmwuahrjauu/9+3eM+Bt969rpTIf+bbdu8Y3VGWUxsqgxCnITKk00UH3B1iZlL+Q==',
      'mining_rig': {
        'name': '56156151',
        'mining_rig_miners_attributes': {
          '0':{
            'hash_rate': '28',
            'brand': "Omar's Brand"
          }
        }
      }
    }
    
  })
})
