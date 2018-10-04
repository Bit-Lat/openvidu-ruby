describe Openvidu::Session do
  before (:each) do
    Openvidu::Settings.configure do |config|
      config.api_url = 'http://www.openvidudomain.com'
      config.api_key = 'example-key'
    end
    stub_request(:any, "#{Openvidu::Settings.config.api_url}/api/tokens" )
    .to_return(
      status: 200,
      body: { token: "wws://openvidudomain/session"}.to_json,
      headers: {"Content-Type"=> "application/json"}
    )
  end


  context "when initialized" do
    subject { Openvidu::Token.new }
    it { should be_an_instance_of Openvidu::Token }
  end

  context "create a token" do
    subject { Openvidu::Token.create(session: '123') }
    it { expect(subject.token).to eq('wws://openvidudomain/session') }
  end


end
