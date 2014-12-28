class Invitation < ActiveRecord::Base
  belongs_to :group
  validates :email, presence: true, uniqueness: true
end
