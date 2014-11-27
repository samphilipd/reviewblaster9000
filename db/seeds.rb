Question.destroy_all

questions = [
  Question.new(name: 'Overall satisfaction of service:'),
  Question.new(name: 'Professionalism and Courtesy of employee'),
  Question.new(name: 'How satisfied were you with the wait time at this store?'),
  Question.new(name: 'How satisfied were you with the in-store setup of your phone?')
]

questions.each do |q|
  q.save!(validate: false)
end
