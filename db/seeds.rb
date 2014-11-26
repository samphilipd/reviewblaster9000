questions = [
  {name: 'Overall satisfaction of service:'},
  {name: 'Professionalism and Courtesy of employee:'},
  {name: 'How satisfied were you with the wait time at this store?'},
  {name: 'How satisfied were you with the in-store setup of your phone?'}

]

Question.destroy_all
Question.create(questions)
