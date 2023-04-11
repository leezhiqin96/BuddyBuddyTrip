puts "Loading default users"
# ===================== Start of User ========================================
5.times do
  faker_first_name = Faker::Name.first_name
  faker_last_name = Faker::Name.last_name
  faker_username = Faker::Internet.username(specifier: faker_first_name)
  faker_email = Faker::Internet.email(
    name: "#{faker_first_name} #{faker_first_name}",
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
puts "Done!!!!!!!!"
