require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('navigating to index page', {:type => :feature}) do
    it('allows a user to view the index page') do
      visit('/')
      expect(page).to have_content('Hello!')
    end
  end
