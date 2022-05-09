require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @parcels = Parcel.all
  erb(:parcels)
end

get('/parcel') do
  @parcel = Parcel.all
  erb(:albums)
end

get('/parcels/new') do
  erb(:new_parcel)
end