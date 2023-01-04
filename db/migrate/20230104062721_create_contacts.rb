class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.text :message, null: false

      t.timestamps
    end
  end
end
