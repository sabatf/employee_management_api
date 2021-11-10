require 'rails_helper'

RSpec.describe 'Employees API', type: :request do
  # initialize test data
  let!(:employees) { create_list(:employee, 10) }
  let(:employee_id) { employees.first.id }

  # Test suite for GET /employees
  describe 'GET /employees' do
    # make HTTP get request before each example
    before { get '/employees' }

    it 'returns employees' do
      json_response = JSON.parse(response.body)
      # pp json_response
      expect(json_response).not_to be_empty
      expect(json_response.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /employees/:id
  describe 'GET /employees/:id' do
    before { get "/employees/#{employee_id}" }

    context 'when the record exists' do
      it 'returns the employee' do
        json_response = JSON.parse(response.body)
        # pp json_response
        expect(json_response).not_to be_empty
        expect(json_response['id']).to eq(employee_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:employee_id) { 10000 }

      it 'returns status code 404' do
        pp response.status
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Employee/)
      end
    end
  end

  # Test suite for POST /employees
  describe 'POST /employees' do

    let(:valid_attributes) {{  name: 'Lorem', last_name: 'Ipsum', status: '2', end_date: '2022/10/10' }}

    context 'when the request is valid' do
      before { post '/employees', params: valid_attributes }

      it 'creates a employee' do
        json_response = JSON.parse(response.body)
        # pp json_response
        expect(json_response['name']).to eq('Lorem')
      end

      it 'have success status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/employees', params: { status: '1' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank, Last name can't be blank/)
      end
    end
  end

  # Test suite for PUT /employees/:id
  describe 'PUT /employees/:id' do
    let(:valid_attributes) { { name: 'Lorem', last_name: 'Ipsum'} }

    context 'when the record exists' do
      before { put "/employees/#{employee_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /employees/:id
  describe 'DELETE /employees/:id' do
    before { delete "/employees/#{employee_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
