class Question < ActiveRecord::Base
  belongs_to(:survey)
  belongs_to(:user)
  validates(:description, length: {minimum: 2})
  validates(:description, length: {maximum: 100})
end
