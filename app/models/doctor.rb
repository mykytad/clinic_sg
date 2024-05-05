class Doctor < ApplicationRecord
  belongs_to :category
  has_many :users, through: :appointments
  has_many :appointments

  def allow_new_appointments?
    @appointments = self.appointments.where(opens: true)
    count_appointments = @appointments.count
    if count_appointments <= 10
      true
    else
      false
    end
  end

  def self.ransackable_associations(auth_object = nil)
    ["appointments", "category", "users"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "email", "encrypted_password", "id", "name", "phone", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
