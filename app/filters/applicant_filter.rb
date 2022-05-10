class ApplicantFilter
    include ActiveModel::Model
  
    attr_accessor :query
  
    def call(current_entity)
      applicants = Applicant.all
      applicants = search(applicants)
      applicants
    end
  
    private
  
    def search(applicants)
        applicants = applicants.where('
            applicants.first_name LIKE :q OR applicants.last_name LIKE :q', q: "%#{@query}%") if @query.present?
            applicants
    end
end