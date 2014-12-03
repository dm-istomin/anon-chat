class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :alias
      t.string  :permanent_name
      t.string  :password_digest
      t.boolean :fixed_identity
    end
  end
end
