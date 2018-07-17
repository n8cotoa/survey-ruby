require('spec_helper')

describe(Survey) do
  it('changes the title to all words having first letter uppercase') do
    test_survey = Survey.create({:title => 'test survey'})
    expect(test_survey.title).to(eq('Test Survey'))
  end
end
