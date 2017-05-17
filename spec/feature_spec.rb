feature 'Navigation' do

  scenario 'Home Page' do

    expect {
    visit '/'
    expect(page).to have_link 'Sign In'
    expect(page).to have_link 'Sign Up'
    click_link 'Sign Up'
    expect(page).to have_content 'Name'
    fill_in :name, with: 'Antother'
    fill_in :email, with: 'User@email.com'
    fill_in :password, with: 'secret234'
    fill_in :password_confirmation, with: 'secret234'
    click_button 'Sign up'
    }.to change(User, :count).by +1

  end

end
