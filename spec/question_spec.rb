require('spec_helper')

describe(Question) do
  describe('#survey') do
    it('will return the survey id of the question after a question is created.') do
      survey = Survey.create({:title => 'Survey 1'})
      question1 = survey.questions.create({:description => 'What is your favorite color', :question_type => 'text'})
      expect(question1.survey_id).to(eq(survey.id))
    end
  end
end
