class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :doctor_id
      t.string :recommendation
      t.boolean :opens

      t.timestamps
    end
  end
end
