require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
  end
end
