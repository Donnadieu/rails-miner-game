require 'rails_helper'

describe WalletsController, type: :controller do
  render_views
  before do
    @user = create(:user)
    @wallet = create(:wallet, user_id: @user.id)
  end
  describe 'GET #show' do
    it 'shows the wallet information' do
      login_with @user
      get :show, params: { "controller"=>"wallets", "user_id"=>"#{@user.id}", "id"=>"#{@wallet.id}" }
      expect(response).to render_template(:show)
    end
  end
end
