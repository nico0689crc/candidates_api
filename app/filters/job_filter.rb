class JobFilter
    include ActiveModel::Model
  
    attr_accessor :query
  
    def call(current_entity)
      jobs = Job.all
      jobs = search(jobs)
      jobs
    end
  
    private
  
    def search(jobs)
        jobs = jobs.where('
            jobs.title LIKE :q', q: "%#{@query}%") if @query.present?
        jobs
    end
end