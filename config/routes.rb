BiSalon::Application.routes.draw do
  root to: 'home#index'

  devise_for :accounts

  devise_scope :account do
    get "sign_in", to: "devise/sessions#new"
  end

  resources :appointments do
    collection do
      get '/:id/clear_appointment', to: 'appointments#clear_appointment'
    end
  end

  resources :invoices do
    collection do
      get '/:id/paid_and_print_invoice', to: 'invoices#paid_and_print_invoice', as: :paid
      get '/:id/apply_point', to: 'invoices#apply_point', as: :apply_point
    end
  end
  resources :invoice_details
  resources :employee_attendants, only: [:index] do
    collection do
      get '/checkin_approve/:id', to: 'employee_attendants#checkin_approve',    as: :checkin_approve
      get '/checkin_deny/:id',    to: 'employee_attendants#checkin_deny',       as: :checkin_deny

      get '/checkout_approve/:id', to: 'employee_attendants#checkout_approve',  as: :checkout_approve
      get '/checkout_deny/:id',   to: 'employee_attendants#checkout_deny',      as: :checkout_deny
    end
  end

  namespace :employee_attendants do
    resources :checkin, only: [:index, :new, :create]
    resources :checkout, only: [:index, :new, :create]
  end

  resources :clients
  resources :employees
  resources :positions, except: [:show]

  resources :settings, only: [:index]
  resources :membership_scoring_conditions
  resources :service_categories
  resources :service_items do
    collection do
      get :filter_by_category
    end
  end
end
