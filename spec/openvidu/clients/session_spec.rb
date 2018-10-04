describe Openvidu::Clients::Session do
  before (:each) do
    Openvidu::Settings.configure do |config|
      config.api_url = 'http://www.openvidudomain.com'
      config.api_key = 'example-key'
    end

    stub_request(:any, "#{Openvidu::Settings.config.api_url}/api/sessions")
      .to_return(
        status: 200,
        body: { id: "123"}.to_json,
        headers: {"Content-Type"=> "application/json"}
      )

  end
  describe "create" do
    subject { Openvidu::Clients::Session.new }
    it "should make post http call" do
      expect(subject.create({}).success?).to be_truthy
    end

    it "should return session id" do
      expect(subject.create({}).body[:id]).to eq("123")
    end
  end

end
