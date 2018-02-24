require 'rails_helper'

describe UsersController, type: :controller do
  render_views

  describe 'GET #index' do
    before do
      @user = create(:user)
    end
    context 'logged in' do
      it 'should be redirected to signin when not logged in' do
        login_with nil
        get :show, params: { "controller"=>"users", "id"=>"#{@user.id}" }
        expect(response).to redirect_to(new_user_session_path)
      end
      it 'should let a user see homepage when logged in' do
        login_with create(:user)
        get :show, params: { "controller"=>"users", "id"=>"#{@user.id}" }
        expect(response).to render_template(:show)
      end
    end
  end
end
