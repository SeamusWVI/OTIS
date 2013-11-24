class NationalOffice < ActiveRecord::Base
  belongs_to :regional_office
  has_many :programmes
  has_many :changes, through: :programmes

  validates :name, :regional_office_id, presence: true

  def top_change
    changes.merge(Change.top(false)).take
  end
end
