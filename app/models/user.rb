class User < ApplicationRecord
  has_many :completed_checkpoints
  has_many :checkpoints, through: :completed_checkpoints
  has_many :resource_ratings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
