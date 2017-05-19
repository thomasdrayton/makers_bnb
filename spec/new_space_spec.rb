feature 'User can create a new space' do
  scenario 'A user can list a space' do
    sign_up
    expect { create_space }.to change { Space.all.count }.by 1
    expect(page).to have_current_path('/spaces')
  end

  scenario 'Spaces with an invalid postcode are not created' do
    sign_up
    expect { create_bad_space }.not_to change { Space.all.count }
    expect(page).to have_content('Please enter a valid UK Postcode')
    expect(page).to have_current_path('/spaces/new')
  end

  scenario 'Does not create a space if the end date is before the start date' do
    sign_up
    expect { create_bad_date_space }.not_to change { Space.all.count }
    expect(page).to have_content('Please Make sure your end date is after your start date')
    expect(page).to have_current_path('/spaces/new')
  end
end
