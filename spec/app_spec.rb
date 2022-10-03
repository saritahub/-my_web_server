require 'spec_helper'
require 'rack/test'
require '/Users/saritaradia/Desktop/Projects/my_web_server/app.rb'

describe Application do
  include Rack::Test::Methods
  let(:app) {Application.new}

  #GET
  context 'GET /' do
    it "Returns message and status 200 OK" do
      response = get('/')
      expect(response.status).to be(200) #Run RSpec in a different terminal
      expect(response.body).to eq('Hello!')
    end
  end

  context 'GET /posts' do
    it "Returns a list of posts with status 200" do
      response = get('/posts')
      expect(response.status).to be(200)
      expect(response.body).to eq('A list of posts')
    end
  end

  context 'POST /posts' do
      it "Returns message with status 200" do
        response = post('/posts')
        expect(response.status).to be(200)
        expect(response.body).to eq('Post was created')
      end
  end

  #Testing drive routes demo example https://www.youtube.com/watch?v=NwKBtzkZrJo
  context "GET /hello" do
    it "Returns 'Hello Anne'" do
      response = get('/hello?name=Anne')
      expect(response.status).to be(200)
      expect(response.body).to eq("Hello Anne")
    end

    it "Returns 'Hello Sara'" do
      response = get('/hello?name=Saar')
      expect(response.status).to be(200)
      expect(response.body).to eq("Hello Saar")
    end
  end

end