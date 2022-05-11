module Api
  module V1     
    class AttendantsController < ApiController
      before_action :set_attendant, only: %i[ show update destroy ]

      # GET /attendants
      def index
        @presenter = AttendantsPresenter.new(params)
        json_response(data: ActiveModel::Serializer::CollectionSerializer.new( @presenter.attendants, serializer: AttendantSerializer))
      end

      # GET /attendants/1
      def show
        json_response(data: AttendantSerializer.new(@attendant))
      end

      # POST /attendants
      def create
        attendant_manager = AttendantManager.new(params: params)
        
        if attendant_manager.create
          json_response(message: I18n.t(:success, scope: %i[messages create]), data: AttendantSerializer.new(attendant_manager.object), status: :created)
        else
          json_response(message: I18n.t(:error, scope: %i[messages create]), data: attendant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /attendants/1
      def update
        attendant_manager = AttendantManager.new(params: params, object: @attendant)
        
        if attendant_manager.update
          json_response(message: I18n.t(:success, scope: %i[messages update]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages update]), data: attendant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /attendants/1
      def destroy
        attendant_manager = JobManager.new(object: @attendant)
        
        if attendant_manager.destroy
          json_response(message: I18n.t(:success, scope: %i[messages destroy]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages destroy]), data: attendant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_attendant
          @attendant = Attendant.find(params[:id])
        end
    end
  end
end