class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false, :limit => 30
      t.string :username, :null => false, :limit => 30
      t.string :hashed_password, :null => false
      t.string :salt, :null => false
      t.string :email
      t.string :gender, :null => false, :limit => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
