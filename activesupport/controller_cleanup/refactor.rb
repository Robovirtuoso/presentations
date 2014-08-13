class ExampleClass
  include ActiveSupport::Rescuable

  rescue_from NoMethodError, :no_method_error_cb
  rescue_from TheThingError, :no_method_error_cb

  def shitty_method
    begin
      do_stuff
    rescue Exception => e
      handler_for_rescue(e) || raise e
    end
  end
end

class LineItemsController
  rescue_from ActiveRecord::RecordNotFound, :record_not_found
  rescue_from LineItemIsBad, :better_line_item

  before_filter :find_line_item

  respond_to :html, :json

  def show
    respond_with @line_item
  end

  def destroy
    @line_item.destroy
  end

  private

  def record_not_found
    redirect_to 'index'
  end

  def better_line_item
    head :ok
  end

  def find_line_item
    @line_item = LineItem.find(params[:id])
  end

end
