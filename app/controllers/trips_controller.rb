class TripsController < ApplicationController

    def index 
        @trips = Trip.all

        render json: @trips, include: [:user,:friend]
    end
    def show 
        @trip = Trip.find(params[:id])
        render json: @trip, include: [:user,:friend]
    end

    def create
        Trip.create(
            name: params[:name],
            startDate: params[:startDate],
            endDate: params[:endDate],
            latitude: params[:latitude],
            longitude: params[:longitude],
            user_id: params[:user_id],
            friend_id: params[:friend_id],
            events: params[:events],
            restaurants: params[:restaurants],
            updates: params[:updates],
            description: params[:description],
            icon: params[:icon]
        )
        Trip.create(
            name: params[:name],
            startDate: params[:startDate],
            endDate: params[:endDate],
            latitude: params[:latitude],
            longitude: params[:longitude],
            user_id: params[:friend_id],
            friend_id: params[:user_id],
            events: params[:events],
            updates: params[:updates],
            description: params[:description],
            restaurants: params[:restaurants],
            icon: params[:icon]
        )
        # render json: @tripOne
        redirect_to trips_path
    end
    def destroy
        @trip = Trip.find(params[:id])
        @trip.destroy
        render json: {message: "Trip: #{@trip.id} has been deleted"}
    end
end
