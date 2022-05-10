class AttendantFilter
    include ActiveModel::Model
  
    attr_accessor :query
  
    def call(current_entity)
      attendants = Attendant.all
      attendants = search(attendants)
      attendants
    end
  
    private
  
    def search(attendants)
        attendants = attendants.where('
            attendants.first_name LIKE :q OR attendants.last_name LIKE :q', q: "%#{@query}%") if @query.present?
            attendants
    end
end