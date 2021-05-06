class CreateDoggs < ActiveRecord::Migration[5.2]
  def change
    create_table :doggs do |t|
      t.string :name

      t.timestamps
    end
  end
end
