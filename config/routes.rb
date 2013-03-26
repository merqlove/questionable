Questionable::Engine.routes.draw do
  post 'answers' => 'answers#create'
  get 'questions/:id' => 'questions#show'
  put 'questions/:id' => 'questions#update'
  post 'questions' => 'questions#create'
  delete 'questions/:id' => 'questions#sestroy'
end
