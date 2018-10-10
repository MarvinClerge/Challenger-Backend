class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :content
      t.string :test

      t.timestamps
    end
  end
end
