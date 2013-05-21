Questionable::Engine.routes.draw do
  post 'answers' => 'answers#create'
  get 'questions/:id' => 'questions#show'
  put 'questions/:id' => 'questions#update'
  post 'questions' => 'questions#create'
  delete 'questions/:id' => 'questions#sestroy'
  resources :question_groups
  #get 'question_groups/:id' => 'question_groups#show'
  #put 'question_groups/:id' => 'question_groups#update'
  #post 'question_groups' => 'question_groups#create'
  #delete 'question_groups/:id' => 'question_groups#sestroy'
end
