class Account < ApplicationRecord
  validates :full_name, :address, :phone, :email, presence: true
  validates :phone, uniqueness: true
  has_many :billings
end
