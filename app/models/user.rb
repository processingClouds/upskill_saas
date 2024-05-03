class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :plan
  
  
  # If pro user passes validation (email, password, ets)
  # than call Stripe and tell stripe to setup a subscription upon charging 
  # the cusomter's card
  # Stripe responds back with customer data.
  # Store customer.id as the customer token and save the user.
  attr_accessor :stripe_card_token
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
