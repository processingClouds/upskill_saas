class Users::RegistrationsController < Devise::RegistrationsController
    # Extend default Devise gee, behavior so that 
    # users signing up with the pro account (plan ID 2)
    # Save with a special Stripe subscription function
    # Otherwise Devie signs up user as usal.
    def create
        super do |resource|
            if params[:plan]
                resource.plan_id = params[:plan]
                if resource.plan_id == 2
                    resource.save_with_subscription
                else
                    resource.save
                end
            end
        end
    end
end