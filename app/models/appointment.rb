class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "doctor_id", "id", "opens", "recommendation", "updated_at", "user_id"]
  end
end
