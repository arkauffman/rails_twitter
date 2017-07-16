class TweetsController < ApplicationController

    def index
        @tweets = Tweet.all 
    end

    def show
        @tweets = Tweet.find(params[:id])
    end

    def new
        @tweets = Tweet.new
    end

    def create
        @tweets = Tweet.new(tweets_params)
        if @tweets.save
            redirect_to tweets_path
        else 
            render :new
        end
    end

    def destroy
        @tweets = Tweet.find(params[:id])
        @tweets.destroy
        redirect_to tweets_path
    end

    def edit
        @tweets = Tweet.find(params[:id])
    end

    def update
        @tweets = Tweet.find(params[:id])

        if @tweets.update_attributes(tweets_params)
            redirect_to tweets_path
        else
            render :edit
        end
    end

    private
        def tweets_params
            params.require(:tweet).permit(:handle, :content)
        end
end
