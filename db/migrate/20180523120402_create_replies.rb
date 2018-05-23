class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :editor
      t.integer :post_id #댓글 모델과 게시글 모델 간을 이어주는 ID키
      t.text :content
    end
  end
end
