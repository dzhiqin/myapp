class AddAvatarToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :avatar, :string, comment: '头像'
  end
end
