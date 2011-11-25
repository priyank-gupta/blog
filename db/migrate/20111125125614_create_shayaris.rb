class CreateShayaris < ActiveRecord::Migration
  def self.up
    create_table :shayaris do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.string :category, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :shayaris
  end
end
