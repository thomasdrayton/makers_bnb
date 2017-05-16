def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in :name, with: "Bertie"
  fill_in :email, with: "Test.email@test.com"
  fill_in :password, with: "Password1234"
  fill_in :password_confirmation, with: "Password1234"
  click_button "Sign up"
end
