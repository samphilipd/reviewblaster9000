Rails.application.routes.draw do
  root to: 'ember#index' # FormatTest.new(:html)

  # Wildcard routing catchall to Ember.
  # route is put into the :path parameter, although Rails never actually uses it
  get '*path' => 'ember#index'
end
