require 'active_record'
require 'rspec'
require 'survey'
require 'question'
require 'answer'
require 'choice'
require 'response'
require 'shoulda-matchers'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each {|survey| survey.destroy}
    Question.all.each {|question| question.destroy}
    Answer.all.each {|answer| answer.destroy}
    # config.formatter = "doc"
  end
end
