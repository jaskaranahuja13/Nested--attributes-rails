class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :job
      t.date :dob

      t.timestamps
    end
  end
end