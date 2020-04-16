class Bank < ApplicationRecord
  validates :name, :bic, presence: true
  has_many :billings 
end
