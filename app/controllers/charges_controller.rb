class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: Amount.default
    }
  end

  def create
    customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    customer: customer.id,
    amount: Amount.default,
    description: "BigMoney Membership - #{current_user.email}",
    currency: 'usd'
    )

    flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    current_user.premium!
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  class Amount
    class << self
      def default
        15_00
      end
    end
  end
end
