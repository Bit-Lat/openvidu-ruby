ApiStruct::Settings.configure do |configure|
  configure.endpoints = {
    openvidu_api: {
      root: Openvidu::Settings.config.api_url,
      headers: {
        'Authorization': Openvidu::Auth.call,
        'Content-Type': 'application/json'
      }
    }
  }
end