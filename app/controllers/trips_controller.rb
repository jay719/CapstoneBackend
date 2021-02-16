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
            description: params[:description]
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
            restaurants: params[:restaurants]
        )
        # render json: @tripOne
        redirect_to trips_path
    end
    def delete
        @trip = Trip.find(params[:id])
        @trip.delete
        render json: {message: "Trip: #{@trip.id} has been deleted"}
    end
end
