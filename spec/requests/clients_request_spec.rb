require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:client) { create(:client) }
  let(:invoice) { create(:invoice, client: client) }
  let(:id) { invoice.id }
  let(:additional) { create(:client) }
  let!(:additional_client) { create(:additional_client, invoice: invoice, client: additional) }

  describe 'POST /store-bahamas-client/:id' do
    let(:valid_attributes) { { fiscal_id: 999_999_999, name: 'Bob', email: 'bob@bob.com' } }

    context 'when request attributes are valid' do
      before { post "/store-bahamas-client/#{id}", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns the additional client' do
        expect(JSON.parse(response.body)).to eq({
                                                  'fiscal_id' => valid_attributes[:fiscal_id],
                                                  'name' => valid_attributes[:name],
                                                  'email' => valid_attributes[:email]
                                                })
      end
    end

    context 'when an invalid request' do
      before { post "/store-bahamas-client/#{id}" }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns a failure message' do
        expect(response.body).to match('{"message":"param is missing or the value is empty: fiscal_id"}')
      end
    end
  end

  describe 'GET /retrieve-bahamas-client/:id' do
    before { get "/retrieve-bahamas-client/#{id}" }

    context 'when invoice does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Invoice with 'id'=0\"}")
      end
    end

    context 'when invoice exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(JSON.parse(response.body)).to eq({
                                                  'fiscal_id' => additional.fiscal_id,
                                                  'name' => additional.name,
                                                  'email' => additional.email
                                                })
      end
    end
  end
end
