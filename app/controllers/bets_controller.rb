class BetsController < RestController
  before_action :get_parent, only: [ :index ]

  def index
    # Retrieve the items (e.g., articles)
    # The query is lazy loaded
    cursor = get_query(get_key)

    # Set an instance variable (e.g., @articles) to the cursor returned
    instance_variable_set( get_name, cursor )

    if @ids and cursor.empty?
      # Return a 404 if expecting individual items and none found
      head :not_found
    else
      # Return a 406 (partial content) if fewer items found than asked for
      # Otherwise, return a 200 OK
      render :index, status: partial_content?(cursor.length)
    end
  end



  def create
    # Create the new item in memory, but do not persist it yet
    # Make sure the item's ID is the one passed in the URL
    new_item = get_class.new( object_params.merge( id: params[:id] ) )

    if new_item.valid?
      begin
        # Check to see if bet already exists
        if old_item = get_class.find_by( id: params[:id] )
          # If exists, return a 401
          head :unauthorized
        else
          # If a create, save the item, return a 201 with a JSON representation
          new_item.save
          DebitCredit.new.debit_wager(object_params)
          
          # puts '>>>>>>>>> BET_TYPE: ', object_params[:bet_type]
          instance_variable_set( get_name, [ new_item ] )
          render :create, status: :created
        end
      rescue
        # If save or destroy fails, return a 500
        head :internal_server_error
      end
    else
      # Return 422 and an error hash if the new item is not valid
      @messages = new_item.errors.messages
      render 'common/errors', status: :unprocessable_entity
    end
  end



  protected

  def get_parent
    @parent = if params[:match_id]
      Match.find(params[:match_id])
    elsif params[:user_id]
      User.find(params[:user_id])
    end
  end

  def configure_controller
    config[:display] = [ :bet_type, :wager, :odds, :is_successful, :gain, :is_settled ]       # Fields to (optionally) include in the JSON
    config[:require] = [ :id, :user_id, :match_id ]                                           # Fields that MUST be included in the JSON
    config[:permit]  = [ :user_id, :match_id, :bet_type, :wager, :odds, :is_successful, :gain, :is_settled ]        # Permitted params for create/replace/update
    config[:include] = [ :user, :match ]                                                      # Associated objects to be eagerly loaded
  end
     

end