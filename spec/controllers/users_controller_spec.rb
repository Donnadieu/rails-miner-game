require 'rails_helper'

describe UsersController, type: :controller do
  render_views
  context 'logged in' do
    it 'should be redirected to signin when not logged in' do
      login_with nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
    it 'should let a user see homepage when logged in' do
      login_with create(:user)
      get :home
      expect(response).to render_template(:home)
    end
  end
end
