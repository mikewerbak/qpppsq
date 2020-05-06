# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |i|
  acc = Account.create!(full_name: "Account ##{i}", phone: "Phone ##{i}", address: "Address ##{i}", email: "email ##{i}")
  b = Bank.create!(name: "Bank ##{i}", bic: "bic ##{i}")
  bb = Billing.create!(bill: "Bill ##{i}", bank: b, account: acc)
end
