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

def create_bad_space
  click_link 'Upload a new space'
  fill_in :name, with: 'Flat'
  fill_in :city, with: 'London'
  fill_in :street, with: 'Comercial Street'
  fill_in :postcode, with: 'AHHHHHHHHHHHHHHHHHH'
  fill_in :price, with: 72.07
  fill_in :description, with: "It's a flat mate"
  fill_in :start_date, with: Date.new(2001,1,2)
  fill_in :end_date, with: Date.new(2002,1,2)
  click_button 'Upload this space'
end

def new_sign_up(user)
  visit '/'
  click_link 'Sign Up'
  fill_in :name, with: user[:name]
  fill_in :email, with: user[:email]
  fill_in :password, with: user[:pass]
  fill_in :password_confirmation, with: user[:conf]
  click_button 'Sign up'
end

def new_sign_in(user)
  visit '/'
  expect(page).to have_link 'Sign In'
  expect(page).to have_link 'Sign Up'
  click_link 'Sign Up'
  expect(page).to have_content 'Name'
  fill_in :name, with: user[:name]
  fill_in :email, with: user[:email]
  fill_in :password, with: user[:pass]
  fill_in :password_confirmation, with: user[:conf]
  click_button 'Sign in'
end

def new_log_out(user)
  click_button 'Log Out'
  expect(page).to have_content "Goodbye #{user[:email]}"
end

def create_successful_request(user)
  visit '/'
  click_link('View available Spaces')
  expect(current_url).to eq 'http://www.example.com/spaces'
  expect(page).to have_content 72.07
  expect(page).to have_content "This property belongs to Peter"
  click_link 'Book This Space'
  # expect(current_url).to eq 'http://www.example.com/requests/new'
  expect(page).to have_content 72.07
  fill_in :start_date, with: "2017/01/01"
  fill_in :end_date, with: "2017/02/01"
  click_button "Request This Space"
  expect(current_url).to eq 'http://www.example.com/spaces'
  expect(page).to have_content("Your booking was successfully made #{user[:name]}")
end

def create_unsuccessful_request(user)
  visit '/'
  click_link('View available Spaces')
  expect(current_url).to eq 'http://www.example.com/spaces'
  expect(page).to have_content 72.07
  expect(page).to have_content "This property belongs to Peter"
  click_link 'Book This Space'
  # expect(current_url).to eq 'http://www.example.com/requests/new'
  expect(page).to have_content 72.07
  fill_in :start_date, with: "2016/01/01"
  fill_in :end_date, with: "2016/02/01"
  click_button "Request This Space"
  expect(current_url).to eq 'http://www.example.com/spaces'
  expect(page).to have_content("The space that you are requesting is unavailable for those dates #{user[:name]}")
end

def create_bad_date_space
  click_link 'Upload a new space'
  fill_in :name, with: 'Flat'
  fill_in :city, with: 'London'
  fill_in :street, with: 'Comercial Street'
  fill_in :postcode, with: 'AHHHHHHHHHHHHHHHHHH'
  fill_in :price, with: 72.07
  fill_in :description, with: "It's a flat mate"
  fill_in :start_date, with: Date.new(2001,1,2)
  fill_in :end_date, with: Date.new(1970,1,2)
  click_button 'Upload this space'
  
def create_successful_space
 click_link 'Upload a new space'
  fill_in :name, with: 'Flat'
  fill_in :city, with: 'London'
  fill_in :street, with: 'Comercial Street'
  fill_in :postcode, with: 'E1 6LT'
  fill_in :price, with: 72.07
  fill_in :description, with: "It's a flat mate"
  fill_in :start_date, with: "2016/11/11"
  fill_in :end_date, with: "2017/04/03"
  click_button 'Upload this space'
  expect(page).to have_content "Space successfully created"
  expect(current_url).to eq 'http://www.example.com/spaces'

end
