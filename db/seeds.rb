puts "Loading default users"
# ===================== Start of User ========================================
5.times do
  faker_first_name = Faker::Name.first_name
  faker_last_name = Faker::Name.last_name
  faker_username = Faker::Internet.username(specifier: faker_first_name)
  faker_email = Faker::Internet.email(
    name: "#{faker_first_name} #{faker_last_name}",
    separators: ['_'],
    domain: 'gmail.com'
  )
  User.create!(
    email: faker_email,
    first_name: faker_first_name,
    last_name: faker_last_name,
    username: faker_username,
    password: 'password'
  )
end
# ===================== End of User ==========================================
puts "Loading Default Itineraries"
# ===================== Start of Itineraries ===============================
10.times do
  rand_start_date = rand(Date.today..(Date.today + 1.year))
  rand_end_date = rand_start_date + rand(3..20).days
  Itinerary.create!(
    name: "Trip to #{%w[China Australia Japan Taiwan Thailand].sample}",
    start_date: rand_start_date,
    end_date: rand_end_date,
    owner_id: User.find(rand(1..5)).id,
    total_budget: 2000
  )
end
# ===================== End of Itineraries =================================
puts "Loading Countries"
# ===================== Start of Countries ===============================
require "json"
require "net/http"

uri = URI('https://countriesnow.space/api/v0.1/countries')
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)
puts parsed_response['msg']

parsed_response['data'].each do |country|
  Country.delete(country['iso2']) if Country.exists?(country['iso2'])
  Country.create!(
    country_code: country['iso2'],
    name: country['country']
  )
  puts "Added #{country['country']} to Countries"
end

# ===================== End of Countries =================================
puts "Loading Cities"
# ===================== Start of Cities ===============================
uri = URI('https://countriesnow.space/api/v0.1/countries')
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)
puts parsed_response['msg']

parsed_response['data'].each do |data|
  data['cities'].each do |city_name|
    city = City.create!(
      name: city_name,
      country_code: Country.find(data['iso2']).country_code
    )
    puts "Added #{city_name} to Cities"
  end
end
# ===================== End of Cities =================================
puts "Done!!!!!!!!"
