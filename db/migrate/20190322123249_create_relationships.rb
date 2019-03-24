class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }
      #外部キーとしてuserテーブルを参照させる。
      t.timestamps
      
      t.index [:user_id, :follow_id], unique: true
      #user_idとfollow_idのペアで保存されないようにする。
    end
  end
end
