class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable#, :omniauthable,
        #  :omniauth_providers => [:facebook] # :confirmable
  include DeviseTokenAuth::Concerns::User
  devise :omniauthable
    has_many :reviews
    has_many :recipe_statuses
    has_many :cart_items
    has_many :shopping_items
  validates_presence_of :name 
  has_many :recipes, class_name: "Recipe", foreign_key: :chef_id#, foreign_key: :chef_id
  validates :role, presence: true, inclusion: { in: %w(chef user)}
end
