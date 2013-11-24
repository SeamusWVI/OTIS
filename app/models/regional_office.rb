class RegionalOffice < ActiveRecord::Base
  has_many :national_offices
  has_many :changes, through: :national_offices

  validates :name, presence: true

  def top_change
    changes.merge(Change.top(false)).take
  end
end
