Rails.application.routes.draw do
  resources :concepts
  devise_for :teachers
  devise_for :students, :controllers => { :registrations => "registrations" }
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'courses#index'
   put 'courses/:id/register', to: 'courses#register'
   get '/learned_courses/:lc_id/concepts/:id/learn', to: 'concepts#learn'
   get '/courses/:id/students', to: 'courses#students'
   get 'courses/:course_id/students/:id', to: 'courses#student_detail'

   resources :courses, shallow: true  do
     resources :concepts, shallow: true  do
       resources :concept_resources
       resources :concept_prerequisites
       resources :assessments
     end
   end

   resources :preferences
   resources :learned_courses
   resources :learned_concepts
   resources :questions

    resources :students

end
