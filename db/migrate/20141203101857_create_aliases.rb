class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.references :user
      t.string :adjective
      t.string :noun
    end
  end
end
