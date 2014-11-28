Question.destroy_all

questions = [
  Question.new(name: 'Overall satisfaction of service:'),
  Question.new(name: 'Professionalism and Courtesy of employee'),
  Question.new(name: 'How satisfied were you with the wait time at this store?'),
  Question.new(name: 'How satisfied were you with the in-store setup of your phone?'),
  Question.new(name: 'How awesome is Ember.js?'),
  Question.new(name: 'How cool is this site?'),
  Question.new(name: 'What is your name?'),
  Question.new(name: 'What is your favorite color?'),
  Question.new(name: 'What is the average airspeed of an unladen swallow (African)?'),
  Question.new(name: 'How many angels can stand on the head of a pin?'),
  Question.new(name: 'What if batman gets bitten by a vampire?'),
  Question.new(name: 'Why is blue?')
]

questions.each do |q|
  q.save!(validate: false)
end
