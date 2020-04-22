Rails.application.routes.draw do
  get "treasure/individual", to: "treasure#individual_treasure"
  get "gemstones", to: "gemstones#index"
  get "art_objects", to: "art_objects#index"
end
