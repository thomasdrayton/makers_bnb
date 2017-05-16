feature 'index' do
  scenario "Homepage has sign in link" do
    visit ('/')
    expect(page).to have_link("Sign in")
  end

    scenario "Homepage has sign up link" do
      visit ('/')
      expect(page).to have_link("Sign up")
    end

    scenario "Homepage has search link" do
      visit ('/')
      expect(page).to have_link("Find a bed n breakfast")
    end
end
