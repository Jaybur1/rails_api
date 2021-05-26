class CreateUseres < ActiveRecord::Migration[6.1]
  def change
    create_table :useres do |t|
      t.string :username

      t.timestamps
    end
  end
end
