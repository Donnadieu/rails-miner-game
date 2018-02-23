require 'rails_helper'

describe UsersController, type: :controller do
  render_views

  describe 'anonymous user' do
    before :each do
      login_with nil
    end
    it 'should be redirected to signin' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

# describe 'GET index' do
#   context 'logged in' do
#     it "should be redirected to signin" do
#       get :index
#       expect( response ).to redirect_to( new_user_session_path )
#     end
#     it 'assigns all users as @users' do
#       @user = create(:user)
#
#       get :index
#
#       expect(assigns(:users)).to eq([@user])
#     end
#   end
# end
