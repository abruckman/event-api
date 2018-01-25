require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  let!(:events) {create_list(:event, 10)}
  let(:event_id) {events.first.id}


  describe 'GET events' do
    before { get '/events'}

    it 'returns events' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /event/:id' do
    before {get "/events/#{event_id}"}


  end


end
