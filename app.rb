require('sinatra')
require("sinatra/reloader")
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/survey')
require('./lib/question')
require('./lib/user')
require('pg')
require('pry')


get('/') do
  erb(:index)
end

get('/survey/initiate') do
  erb(:initiate)
end

post('/survey/create') do
  title = params.fetch('title')
  @num_of_questions = params.fetch('num_of_questions').to_i
  @survey = Survey.create({:title => title})
  erb(:create)
end

post('/survey/:id') do
  @survey = Survey.find(params.fetch(:id))
  @num_of_questions = params.fetch('num_of_questions').to_i
  x = 1
  until x > @num_of_questions do
    description = params.fetch('question' + x)
    @survey.question.create({:description => description, :question_type => 'text'})
    x += 1
  end
  erb(:survey_added)
end

get('/survey/all') do
  @surveys = Survey.all
  erb(:all_surveys)
end
