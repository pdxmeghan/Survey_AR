require 'active_record'
require './lib/survey'
require './lib/question'
require './lib/answer'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  loop do
    puts "Press 's' to create a new survey"
    puts "Press 'v' to view all surveys"
    puts "Press 'x' to exit"
    menu_choice = gets.chomp
    if menu_choice == 's'
      create_survey
    elsif menu_choice == 'v'
      view_surveys
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
    puts survey.name
  end
end

main_menu
