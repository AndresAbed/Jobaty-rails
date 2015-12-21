require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  describe 'index' do
    it 'gets index path' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe 'offers' do
    it 'gets offers path' do
      get :offers
      expect(response).to have_http_status(:success)
    end
  end
  describe 'profile' do
    it 'gets employee profile path' do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end
end