class AddressBook < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: {scope:  :address, message: "address & name already exists"}
end
