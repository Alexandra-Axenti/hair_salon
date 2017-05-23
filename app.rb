require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/form') do
  erb(:form)
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/about') do
  erb(:about)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get('/appointments') do
  @clients = Client.all()
  erb(:appointments)
end

get('/sales') do
  erb(:sales)
end

get('/services') do
  erb(:services)
end
