class BidsController < ApplicationController
  before_action :bid, except: [:new, :create, :index]

  def index
  flash[:success] = "You have been signed in"
  @bids = current_haulier.bids
  end

  def new
    @bid = current_haulier.bids.new
  end

  def create
    @bid = current_haulier.bids.new(bid_params)
    if @bid.save
      redirect_to bids_path
    else
      render :new
    end
  end

  def show
    @bids = Bid.all.order('created_at ASC')
  end

  def edit

  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      redirect_to bids_path
    else
      render :edit
    end
  end

  def destroy
    @bid.destroy
    redirect_to bids_path
  end

  private

    def bid_params
      params.require(:bid).permit(:amount, :expiration)
    end

    def bid
      @bid = Bid.find(params[:id])
    end
end
