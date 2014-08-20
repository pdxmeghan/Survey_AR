require 'active_record'
require './lib/survey'
require './lib/question'
require './lib/answer'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  loop do
    puts "Press '1' to create a new survey"
    puts "Press '2' to view all surveys"
    puts "Press '3' to add questions to a survey"
    puts "Press '4' to view all questions"
    puts "Press '5' to add answers to a question"
    puts "[6] - Take a survey"
    puts "Press 'x' to exit"
    menu_choice = gets.chomp
    if menu_choice == '1'
      create_survey
    elsif menu_choice == '3'
      add_question
    elsif menu_choice == '4'
      view_questions
    elsif menu_choice == '2'
      view_surveys
    elsif menu_choice == '5'
      add_answers
    elsif menu_choice == '6'
      take_survey
    elsif menu_choice == 'x'
      puts "Goodbye!"
      exit
    else
      puts "Please input a valid choice"
    end
  end
end

def create_survey
  puts "What would you like your survey to be called?\n"
  survey_name = gets.chomp
  new_survey = Survey.create({name: survey_name})
  puts "\nThanks! #{new_survey.name} has been created.\n"
end

def view_surveys
  puts "\nHere are all the surveys that have been created:\n"
  Survey.all.each do |survey|
    puts "(#{survey.id}) --  #{survey.name}"
  end
end

def view_questions
  puts "\nHere are all the questions that have been created:\n"
  Question.all.each do |question|
    puts "(#{question.id}) -- #{question.name}"
  end
end

def add_question
  view_surveys
  puts "Choose survey # to add question to"
  survey_choice = gets.chomp.to_i
  current_survey = Survey.find(survey_choice)
  puts "What is the question for your survey?"
  question = gets.chomp
  new_question = Question.create({name: question})
  current_survey.questions << new_question
end


def add_answers
  view_questions
  puts "\nChoose a question # to add answers to\n"
  question_choice = gets.chomp.to_i
  current_question = Question.find(question_choice)
  4.times do
    puts "Enter answer: "
    answer_input = gets.chomp
    answer = Answer.create({name: answer_input})
    current_question.answers << answer
  end
end

def take_survey
  view_surveys
  puts "\nWhat # survey would you like to take?\n"
  survey_choice = gets.chomp.to_i
  current_survey = Survey.find(survey_choice)
  current_survey.questions.each do |question|
    puts question.name
    question.answers.each do |answer|
      puts "*#{answer.id}* - #{answer.name}"
    end
    puts "\nInput the *number* of your choice.\n"
    answer_input = gets.chomp
  end
end


main_menu
