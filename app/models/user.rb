require_relative '../uploaders/avatar_uploader.rb'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  has_many :reviews
  has_many :votes
  has_many :venues

  include PgSearch
  pg_search_scope :search_by_username,
                   against: :username,
                   using: { tsearch: { prefix: true } }

  def admin?
    role == "admin"
  end
end
