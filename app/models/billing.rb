class Billing < ApplicationRecord
  validates :bill, uniqueness: true, presence: true
  belongs_to :account
  belongs_to :bank
end
