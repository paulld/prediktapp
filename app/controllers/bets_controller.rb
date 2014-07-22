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
    new_bet = Bet.new( object_params.merge( id: params[:id] ) )

    if new_bet.valid?
      begin
        # If a bet already exists with this id, return a 401
        if old_bet = Bet.find_by( id: params[:id] )
          head :unauthorized
        else
          CoinTransaction.transaction do
            begin
              new_bet.save
              # Debit the wager value from the user's coin account:
              DebitCredit.new(current_user).debit_wager(object_params[:wager])
              
              # Create a new CoinTransaction with all the bet information
              DebitCredit.new(current_user).record_debit_transaction(object_params[:wager], new_bet.id, object_params[:match_id])

              # If 3 actions successful, return a 201 with a JSON representation
              instance_variable_set( get_name, [ new_bet ] )
              render :create, status: :created
            rescue
              head :unprocessable_entity
            end
          end

        end
      rescue
        # If save or destroy fails, return a 500
        head :internal_server_error
      end
    else
      # Return 422 and an error hash if the new item is not valid
      @messages = new_bet.errors.messages
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