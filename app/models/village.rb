class Village < ActiveRecord::Base
  before_save { |village| village.name.capitalize! }

  belongs_to :programme
  has_many :discussions
  has_many :conversations, through: :discussions
  has_many :changes, through: :conversations

  validates :name, :programme_id, presence: true
  validates :name, uniqueness: { scope: :programme_id } 
  
  def top_change
    changes.merge(Change.top(false)).take
  end
end
