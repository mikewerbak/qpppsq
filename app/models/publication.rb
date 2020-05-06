class Publication < ApplicationRecord
  validates :title, :description, :publisher_id, presence: true
  validates :title, uniqueness: true
end
