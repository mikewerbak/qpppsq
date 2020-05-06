class Answer < ApplicationRecord
  validates :body, :question, presence: true
  belongs_to :question
end
