module Spina::Shop
  class OrderTransition < ApplicationRecord
    belongs_to :order, inverse_of: :order_transitions
  end
end