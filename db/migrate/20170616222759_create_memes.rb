class CreateMemes < ActiveRecord::Migration[5.1]
  def change
    create_table :memes do |t|
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
