Rails.application.routes.draw do
  root to: 'ember#index' # FormatTest.new(:html)

  # API routes go here
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :questions, only: [:index, :show, :update] do
      end
    end
  end

  # Wildcard routing catchall to Ember.
  # route is put into the :path parameter, although Rails never actually uses it
  get '*path' => 'ember#index'
end
