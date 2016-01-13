class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators
  after_initialize :init

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]

  def init
    self.role   ||= :standard
  end
end
