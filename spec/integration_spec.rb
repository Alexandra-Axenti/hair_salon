require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('navigating to index page', {:type => :feature}) do
    it('allows the admin to view all clients and stylists on the index page') do
      visit('/')
      expect(page).to have_content(Stylist.all())
      expect(page).to have_content(Client.all())
      expect(page).to have_content('Add Stylist','Add Client')
    end
  end
