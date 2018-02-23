require 'rails_helper'

describe UsersController, type: :controller do
  render_views
  let(:valid_attributes) {
    {
      username: 'omar',
      email: 'omar@email.com',
      password: '12345678'
    }
  }
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all users as @users' do
      user = User.create! valid_attributes

      get :index, params: {}, session: valid_session

      expect(assigns(:users)).to eq([user])
    end
    context 'logged in' do
      it 'redirects user to loggin page if not logged in' do
        get :index
        expect(response.body).to include "Log In"
      end
    end
  end
end
