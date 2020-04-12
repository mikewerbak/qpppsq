class Biling < ApplicationRecord
  validates :bill, :uniqueness presence: true
  belongs_to :account 
end
