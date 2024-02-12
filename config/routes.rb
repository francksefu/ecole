Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "homes#index"
   resources :parents
   resources :students do
    resources :promotions, only: [:new, :create]
   end
   resources :teachers do
    resources :course_teachers do 
      resources :periodes do 
        
        resources :date_evaluations, only: [:new, :create] 
        resources :promotions, only: [:index] do
          resources :date_evaluations, only: [:new, :create] do
            resources :evaluates, only: [:new, :create]
          end
        end
        
      end
    end
   end
   resources :accountants
   resources :studies_directors
   resources :discipline_directors
   resources :sections
   resources :classrooms do
    resources :classroom_courses
    resources :classroom_teachers, only: [:index]
   end
   resources :courses
   resources :years do
    resources :periodes
   end
   
end                                                          
