class EditDataTypeInAnswersQuestions < ActiveRecord::Migration
  def change
    remove_column :answers_questions, :question_id
    remove_column :answers_questions, :answer_id

    add_column :answers_questions, :question_id, :integer
    add_column :answers_questions, :answer_id, :integer
  end
end
