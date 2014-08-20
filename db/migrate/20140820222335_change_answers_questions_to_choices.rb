class ChangeAnswersQuestionsToChoices < ActiveRecord::Migration
  def change
    rename_table :answers_questions, :choices
  end
end
