questions = [
  {name: 'Overall satisfaction of service:', rating: 0},
  {name: 'Professionalism and Courtesy of employee:', rating: 0},
  {name: 'How satisfied were you with the wait time at this store?', rating: 0},
  {name: 'How satisfied were you with the in-store setup of your phone?', rating: 0}

]

Question.destroy_all
Question.create(questions)
