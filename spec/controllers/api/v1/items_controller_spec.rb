require 'rails_helper'
RSpec.describe Api::V1::ItemsController do
  # initialize test data
  let!(:item) { create(:item) }
  let!(:item_with_tags) { create(:item_with_tags) }
  let(:item_id) { item.id }

  describe "GET #index" do
    before do
      get :index
    end

    it 'returns items' do
      expect(assigns(:items)).not_to be_nil
      expect(assigns(:items).size).to eq(32)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
