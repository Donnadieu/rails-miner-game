require 'pry'
require 'rails_helper'

describe 'Feature Test: User', type: :feature do
  describe 'Log In with Omniauth' do
    it 'has the option of siging up with Facebook' do
      visit new_user_registration_path
      expect(page).to have_content('Facebook')
    end
  end
end
