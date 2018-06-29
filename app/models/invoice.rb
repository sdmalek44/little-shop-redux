class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id, :status
end
