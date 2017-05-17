feature 'index' do
  scenario "Homepage has sign in link" do
    visit ('/')
    expect(page).to have_link("Sign In")
  end

    scenario "Homepage has sign up link" do
      visit ('/')

      expect(page).to have_link("Sign Up")
    end
end
