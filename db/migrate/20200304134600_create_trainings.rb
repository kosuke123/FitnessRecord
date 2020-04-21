class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :body

      t.integer :howmany

      t.integer :howmanysets

      t.datetime :datetime

      t.string :image

      t.string :movie

      t.integer :user_id

      t.integer :kind_id
      
      t.timestamps
    end
  end
end
