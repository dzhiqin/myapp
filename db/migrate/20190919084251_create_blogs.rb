class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id, comment: "用户id"
      t.text :content, comment: "内容"

      t.timestamps
    end
  end
end
