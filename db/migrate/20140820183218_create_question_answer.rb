class CreateQuestionAnswer < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.column :question_id, :string
      t.column :answer_id, :string

      t.timestamps
    end
  end
end
