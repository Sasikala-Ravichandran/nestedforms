class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :number
      t.string :state
      t.references :driver, index: true

      t.timestamps null: false
    end
    add_foreign_key :licenses, :drivers
  end
end
