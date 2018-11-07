class User < ApplicationRecord
  after_create :create_tenant

  has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name
  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/ }

  # def full_name
  #   self.first_name + " " + self.last_name
  # end
  
  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end

end
