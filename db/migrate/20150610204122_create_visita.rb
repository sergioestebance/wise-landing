class CreateVisita < ActiveRecord::Migration
  def change
    create_table :visita do |t|
      t.string :email
      t.string :ip
      t.string :referral_id
      t.string :invited_by

      t.timestamps
    end
  end
end
