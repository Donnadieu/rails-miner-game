require 'pry'
require 'rails_helper'

describe 'Feature Test: User', type: :feature do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end
  describe 'Log In with Omniauth' do
    it 'has the option of siging up with Facebook' do
      visit new_user_registration_path
      expect(page).to have_content('Facebook')
    end
    it 'should sign up the user whe clicking "Sign in with Facebook" ' do
      visit home_path
      click_link 'Sign in with Facebook'
      expect(User.last.uid).to eq('12345')
    end
    it 'should sign in the user whe clicking "Sign in with Facebook" ' do
      visit new_user_session_path
      click_link 'Sign in with Facebook'
      expect(current_path).to eq('/home')
    end
  end
  describe 'wallet creation' do
    it 'creates a wallet for the user upon siging up' do
      visit new_user_registration_path

      fill_in 'user_username', with: 'Omar'
      fill_in 'user_email', with: 'newmail@email.com'
      fill_in 'user_password', with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      click_button 'Sign up'

      expect(User.last.wallet).to be_instance_of(Wallet)
    end
  end
end
