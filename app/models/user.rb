class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable # :confirmable
 include DeviseTokenAuth::Concerns::User
    has_many :recipe_statuses
  validates_presence_of :name 
  has_many :recipes, class_name: "Recipe", foreign_key: :chef_id#, foreign_key: :chef_id
  validates :role, presence: true, inclusion: { in: %w(chef user)}
end
