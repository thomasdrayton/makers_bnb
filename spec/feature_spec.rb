feature 'Navigation' do

  scenario 'Home Page' do

    expect {
    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
    click_link 'Sign up'
    expect(page).to have_content 'Name'
    fill_in :name, with: 'Antother'
    fill_in :email, with: 'User@email.com'
    fill_in :password, with: 'secret234'
    fill_in :password_confirmation, with: 'secret234'
    click_button 'Sign up'
    }.to change(User, :count).by +1

  end

end
