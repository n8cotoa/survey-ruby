class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:title, length: {minimum: 2})
  validates(:title, length: {maximum: 100})
  before_save(:title_case)

  private
    def title_case
      self.title = (title.split(/(\W)/).map(&:capitalize).join)
    end
end
