class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :login
      t.string :password
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
