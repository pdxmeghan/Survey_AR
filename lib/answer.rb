class Answer < ActiveRecord::Base
  has_many :choices
  has_many :questions, through: :choices
end
