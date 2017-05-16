feature 'Navigation' do

  scenario 'Home Page' do

    p ENV['RACK_ENV']

    visit '/'
    expect(page).to have_link 'Sign in'
    expect(page).to have_link 'Sign up'
    click_link 'Sign up'


    expect(page).to have_content 'Name'

    p User.all.count

    fill_in :name, with: 'Antother'
    fill_in :email, with: 'User@email.com'
    fill_in :password, with: 'secret234'
    fill_in :password_confirmation, with: 'secret234'
    click_button 'Sign up'

    p User.all.count

  end

end
