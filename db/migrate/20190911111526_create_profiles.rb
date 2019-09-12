class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id,:index=>true, comment: 'user_id'
      t.string :name, comment: '名称'
      t.date :birthday, comment: '生日'
      t.string :address, comment: '地址'
      t.string :education, comment: '学历'
      t.string :occupation, comment: '职业'
      t.text :bref_introduction, comment: '简介'
      t.text :remark, comment:'备注'
      t.timestamps
    end
  end
end
