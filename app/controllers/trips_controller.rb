class TripsController < ApplicationController

    def index 
        @trips = Trip.all

        render json: @trips, include: [:user,:friend]
    end

    def create
        Trip.create(
            name: params[:name],
            startDate: params[:startDate],
            endDate: params[:endDate],
            latitude: params[:latitude],
            longitude: params[:longitude],
            user_id: params[:user_id],
            friend_id: params[:friend_id]
        )
        Trip.create(
            name: params[:name],
            startDate: params[:startDate],
            endDate: params[:endDate],
            latitude: params[:latitude],
            longitude: params[:longitude],
            user_id: params[:friend_id],
            friend_id: params[:user_id]
        )
        redirect_to trips_path
    end
end
