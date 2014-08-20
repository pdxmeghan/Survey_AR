class ChangeQuestionAnswersTableToAnswersQuestions < ActiveRecord::Migration
  def change
    rename_table :question_answers, :answers_questions
  end
end
