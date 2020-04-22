# frozen_string_literal: true

json.art_objects @response[:art_objects], partial: 'art_objects/art_object', as: :art_object
json.total_cost_in_gp @response[:total_cost_in_gp]
