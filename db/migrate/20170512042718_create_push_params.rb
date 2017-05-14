class CreatePushParams < ActiveRecord::Migration[5.1]
  def change
    create_table :push_params do |t|
      t.string :p256dh
      t.string :auth
      t.string :endpoint

      t.timestamps
    end
  end
end
