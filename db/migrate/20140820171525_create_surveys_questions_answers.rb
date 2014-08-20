class CreateSurveysQuestionsAnswers < ActiveRecord::Migration
  def change
    create_table :surveys_questions_answers do |t|
      t.column :survey_id, :string
      t.column :question_id, :string
      t.column :answer_id, :string

      t.timestamps
    end
  end
end
