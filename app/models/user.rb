class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_name
  # attr_accessible :title, :body
  validates :user_name, presence: true, :allow_blank => false, :uniqueness => { :case_sensitive => false }

  has_many :answers, dependent: :destroy
end
