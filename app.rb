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

post('/survey/create/:id') do
  @survey = Survey.find(params.fetch(:id))
  @num_of_questions = params.fetch('num_of_questions').to_i
  x = 1
  until x > @num_of_questions do
    description = params.fetch('question' + x.to_s)
    @survey.questions.create({:description => description, :question_type => 'text'})
    x += 1
  end
  erb(:survey_added)
end

get('/survey/:id/edit') do
  @survey = Survey.find(params.fetch(:id))
  erb(:survey_edit)
end

patch('/survey/:id/edit') do
  @survey = Survey.find(params.fetch(:id))
  @num_of_questions = @survey.questions.count
  x = 1
  @survey.questions.each do |question|
    new_description = params.fetch("new_description" + x.to_s)
    question.update({:description => new_description})
    x += 1
  end
  erb(:survey_edit)
end

delete('/survey/:id/edit') do
  @survey = Survey.find(params.fetch(:id))
  question = Question.find(params.fetch('select-question').to_i)
  question.destroy
  erb(:survey_edit)
end

post('/survey/:id/edit') do
  @survey = Survey.find(params.fetch(:id))
  question = @survey.questions.create({:description => params.fetch('new_question'), :question_type => 'text'})
  erb(:survey_edit)
end

get('/survey/all') do
  @surveys = Survey.all
  erb(:all_surveys)
end

get('/survey/:id') do
  @survey = Survey.find(params.fetch(:id))
  erb(:survey)
end

delete('/') do
  @survey = Survey.find(params.fetch('survey_id'))
  @survey.destroy
  erb(:index)
end
