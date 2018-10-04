describe Openvidu::Clients::Client do
  before (:each) do
    Openvidu::Settings.configure do |config|
      config.api_url = 'http://www.openvidudomain.com'
      config.api_key = 'example-key'
    end

    stub_request(:any, Openvidu::Settings.config.api_url)

  end
  describe "get request" do
    subject { Openvidu::Clients::Client.new }
    it "should make GET http call" do
      expect(subject.get().success?).to be_truthy
    end
  end

  describe "basic auth" do
    subject { Openvidu::Clients::Client.new }
    it "should have basic auth" do
      expect(subject.get().status).to eq(200)
    end
  end
end
