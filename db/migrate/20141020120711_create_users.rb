class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :alias
      t.string :permanent_name
      t.string :password_digest
    end
  end
end
