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
      visit home_path
      click_link 'Sign in with Facebook'
      expect(current_user.uid).to eq('12345')
    end
  end
end
