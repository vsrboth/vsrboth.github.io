BiSalon::Application.routes.draw do

  devise_for :accounts

  devise_scope :account do
    root :to => 'devise/sessions#new'
  end
end
