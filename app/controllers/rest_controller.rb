class RestController < ApplicationController
  before_action :get_object, only: [ :update, :destroy ]

  def index
    qry = get_class.includes(get_includes)

    @objects = if params[:ids]
      qry.where(id: params[:ids].split(",")).to_a
    else
      qry.all.to_a
    end

    head :not_found if @objects.empty?
  end

  def create_or_replace
    new_object = get_class.new(
      object_params.merge( id: params[:id] )
    )

    head :unprocessable_entity unless new_object.valid?

    begin
      if old_object = get_class.find_by( id: params[:id] )
          old_object.destroy
          new_object.save
          head :no_content
      else
        new_object.save
        @objects = [new_object]
        render :index, status: :created
      end
    rescue
      head :internal_server_error
    end
  end

  def update
    if @object.update_attributes( object_params )
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def destroy
    if @object.destroy
      head :no_content
    else
      head :internal_server_error
    end
  end

  protected

  def get_object
    head :not_found unless @object = get_class.find_by( id: params[:id] )
  end

  def get_includes
    []
  end

  def get_class
    params[:controller].singularize.camelize.constantize
  end

  def object_params
    params.require(params[:controller].singularize.to_sym).permit(:id)
  end
end