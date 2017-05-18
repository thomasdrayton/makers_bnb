def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in :name, with: 'Bertie'
  fill_in :email, with: 'Test.email@test.com'
  fill_in :password, with: 'Password1234'
  fill_in :password_confirmation, with: 'Password1234'
  click_button 'Sign up'
end

def create_space
  click_link 'Upload a new space'
  fill_in :name, with: 'Flat'
  fill_in :city, with: 'London'
  fill_in :street, with: 'Comercial Street'
  fill_in :postcode, with: 'E1 6LT'
  fill_in :price, with: 72.07
  fill_in :description, with: "It's a flat mate"
  fill_in :start_date, with: Date.new(2001,1,2)
  fill_in :end_date, with: Date.new(2002,1,2)
  click_button 'Upload this space'
end
