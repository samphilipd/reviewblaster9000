Question.delete_all
Answer.delete_all

questions = [
  Question.new(name: 'Overall satisfaction of service:', flavour: 'Rating'),
  Question.new(name: 'Professionalism and Courtesy of employee', flavour: 'Rating'),
  Question.new(name: 'How satisfied were you with the wait time at this store?', flavour: 'Rating'),
  Question.new(name: 'How satisfied were you with the in-store setup of your phone?', flavour: 'Rating'),
  Question.new(name: 'Is Ember.js awesome?', flavour: 'Predicate'),
  Question.new(name: 'How cool is this site?', flavour: 'Rating'),
  Question.new(name: 'Rails is omakase', flavour: 'Predicate'),
  Question.new(name: 'This is the last question', flavour: 'Predicate'),
  # Question.new(name: 'What is the average airspeed of an unladen swallow (African)?'),
  # Question.new(name: 'How many angels can stand on the head of a pin?'),
  # Question.new(name: 'What if batman gets bitten by a vampire?'),
  # Question.new(name: 'Why is blue?')
]

questions.each do |q|
  q.save!(validate: false)
end
