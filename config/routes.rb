Rails.application.routes.draw do
  root to: 'pages#home'
  get '/privacy_policy', to: 'pages#privacy_policy'
  get '/terms_of_service', to: 'pages#terms_of_service'
  get '/contact', to: 'pages#contact'
  get '/comment_form', to: 'pages#comment_form'
  get '/steps', to: 'pages#steps'
  get '/checkup', to: 'pages#checkup'

  get '/hello', to: 'hello#index'

  devise_for :admin_users, only: [:sessions], controllers: {
    sessions: 'admin_users/sessions',
  }
  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions',
  }
  devise_for :employees, controllers: {
    registrations: 'employees/registrations',
    sessions: 'employees/sessions',
  }

  resources :admin_users, only: [:show]
  resources :students, only: [:show] do
    resources :course_orders, controller: 'students/course_orders', only: [:index, :create, :destroy]
    resources :internships, controller: 'students/internships', only: [:index]
    resources :internship_carts, controller: 'students/internship_carts', only: [:create, :destroy]
    resources :internship_orders, controller: 'students/internship_orders', only: [:create] do
      post '/contact', to: 'students/internship_orders#contact'
    end
  end
  resources :employees, only: [:show] do
    resources :course_orders, controller: 'employees/course_orders', only: [:index, :create, :destroy]
  end
  resources :internships, only: [:index, :show]
  resources :courses, only: [:index, :show]
  resources :announcements, only: [:index, :show]

  resources :companies, only: [:index, :show, :edit, :update] do
    resources :internships, controller: 'companies/internships'
  end

  namespace :admin do
    resources :admin_users
    resources :students
    resources :student_details
    resources :business_categories
    resources :companies
    resources :employees
    resources :employee_details
    resources :internship_categories
    resources :internship_attendance_types
    resources :internships
    resources :internship_carts
    resources :internship_orders
    resources :course_categories
    resources :course_attendance_types
    resources :courses
    resources :student_course_orders
    resources :employee_course_orders
    resources :announcement_categories
    resources :announcements
    resources :nagaoka_companies

    root to: "companies#index"
  end

  get '/admin/mailers/form', to: 'admin_mailers#form'
  post '/admin/mailers/post', to: 'admin_mailers#post'
end
