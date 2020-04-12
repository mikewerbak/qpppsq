class Bank < ApplicationRecord
  validates :name, :bic presence: true
end
