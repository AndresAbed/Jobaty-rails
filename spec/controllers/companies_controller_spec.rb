require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'index' do
    it 'redirects to companies_path' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
