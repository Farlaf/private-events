class SubscriptionsController < ApplicationController

    def create
        subscription = Subscription.new(subscription_params)

        if subscription.save
            redirect_to event_url(subscription.event_id), notice: "Subscription was successfully saved." 
        else
            redirect_to event_url(subscription.event_id), alert: "Something was wrong." 
        end
    end

    def destroy
        subscription = Subscription.find_by(subscription_params)
        subscription.destroy
        redirect_to event_url(subscription.event_id), notice: "Subscription was successfully destroyed." 
    end

    private

    def subscription_params
        params.require(:subscription).permit(:user_id, :event_id)
    end
end
