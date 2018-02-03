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

    context 'when the record exists' do
      it 'returns the event' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(event_id)
      end

      it 'returns status code 200' do
        expect(resonse).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let (:event_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end

  end

  describe 'POST /events' do
    let(:valid_attributes) {{name: 'the big concert', date: Faker::Date.forward(200)}}

    before { post '/events', params: valid_attributes}

    it 'creates a event' do
      expect(json['name']).to eq('the big concert')
    end

    it 'returns status 201' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /events/:id' do
    let(:valid_attributes) { { name: 'the big concert' } }

    before { put "/events/#{event_id}" , params: valid_attributes }

    it 'updates the record' do
      expect(response.body).to be_empty
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'DELETE /events/:id' do
    before {delete "/events/#{event_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
