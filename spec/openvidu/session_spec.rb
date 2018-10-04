describe Openvidu::Session do
  before (:each) do
    Openvidu::Settings.configure do |config|
      config.api_url = 'http://www.openvidudomain.com'
      config.api_key = 'example-key'
    end
    stub_request(:any, "#{Openvidu::Settings.config.api_url}/api/sessions" )
    .to_return(
      status: 200,
      body: { id: "123"}.to_json,
      headers: {"Content-Type"=> "application/json"}
    )
  end


  context "when initialized" do
    subject { Openvidu::Session.new }
    it { should be_an_instance_of Openvidu::Session }
  end

  context "create a session" do
    subject { Openvidu::Session.create(media_mode: :routed) }
    it { expect(subject).to be_an_instance_of Openvidu::Session }
    it { expect(subject.id).to eq('123') }
  end

  context "raise error" do
    it "raise error when media mode is no set to neither routed or relayed" do
      expect {Openvidu::Session.create(media_mode: :other)}.
        to raise_error(Openvidu::OpenviduArgumentError, "media mode must be either routed or relayed")
    end

    it "raise error when recording mode is no set to neither always or custom" do
      expect {Openvidu::Session.create(recording_mode: :other)}.
        to raise_error(Openvidu::OpenviduArgumentError, "recording mode must be either always or custom")
    end
  end


end
