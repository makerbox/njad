class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :purchases
  has_many :products, through: :purchases
  has_many :wish_products
  has_many :products, through: :wish_products
  has_many :reviews
  has_many :products, through: :reviews
  after_save :welcome_user

  def welcome_user
      if Invitation.find_by(email: self.email)
        @membership = Membership.new
        @membership.user = self
        @membership.group = Invitation.find_by(email: self.email).group
        @membership.save 
      else
        NotificationMailer.signup_receipt(self).deliver
      end
  end

end
