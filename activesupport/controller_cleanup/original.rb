class LineItemsController
  def show
    begin
      @line_item = LineItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render 'index'
    end
  end

  def index
    @line_items = LineItem.all

    begin
      @line_items.save
    rescue LineItemNotValidForCode
      respond_to do |format|
        format.html {}
        format.json {}
      end

    rescue LineItemIsBad
      respond_to do |format|
        format.html {}
        format.json {}
      end
    end
  end

  def destroy
    begin
      @line_item = LineItem.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to 'index'
    end

    @line_item.destroy
  end
end

ActiveSupport::Rescuable
