# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
DatabaseCleaner.clean_with :truncation

Job.create([{
    title: "Cillum adipisicing proident sunt 1",
    description: "Deserunt nostrud amet nisi quis tempor voluptate minim proident id minim excepteur ea sint consequat. Id aliquip ipsum ex duis laboris sit eu magna. Proident velit incididunt duis sit laboris ut fugiat dolore."
},{
    title: "Cillum adipisicing proident sunt 2",
    description: "Nostrud aute enim id ex magna cupidatat aliquip in. Nulla nisi excepteur consectetur eu est. Non laborum excepteur ex ipsum. Labore occaecat reprehenderit minim aute Lorem."
}])

Attendant.create([{
    first_name: "Logan",
    last_name: "Griffith",
    contact_email: "evpes@af.gy",
    company_name: "Door except sense",
    contact_linked_in: "http://bospekwuf.br/linmames"
},{
    first_name: "Barry",
    last_name: "Alexander",
    contact_email: "owa@hokudoh.ao",
    company_name: "Bring pupil particular",
    contact_linked_in: "http://tolavki.at/uh"
}])

Pipeline.create([{
    title: "Job 1 - Step 1",
    description: "Magna ullamco mollit amet anim exercitation eu magna ipsum nostrud esse consequat.",
    order: 1,
    job_id: 1,
    attendant_id: 1
},{
    title: "Job 1 - Step 2",
    description: "Consectetur pariatur sint dolor consequat dolore minim culpa tempor id occaecat.",
    order: 2,
    job_id: 1,
    attendant_id: 2
},{
    title: "Job 2 - Step 1",
    description: "Magna ullamco mollit amet anim exercitation eu magna ipsum nostrud esse consequat.",
    order: 1,
    job_id: 2,
    attendant_id: 1
},{
    title: "Job 2 - Step 2",
    description: "Consectetur pariatur sint dolor consequat dolore minim culpa tempor id occaecat.",
    order: 2,
    job_id: 2,
    attendant_id: 2
},{
    title: "Job 2 - Step 3",
    description: "Consectetur pariatur sint dolor consequat dolore minim culpa tempor id occaecat.",
    order: 3,
    job_id: 2,
    attendant_id: 2
},])

Applicant.create([{
    first_name: "Marian",
    last_name: "Holmes",
    email: "miwwupi@louranez.fm"
},{
    first_name: "Ryan",
    last_name: "Lawrence",
    email: "zapugzoh@omocojwu.np"
}])

JobsApplicant.create([{
    job_id: 1,
    applicant_id: 1,
    url_token: "fSC4UBw2CioN7iPykT4z6Q4XmoYkH0BYPm4DSWSkW"
},{
    job_id: 2,
    applicant_id: 2,
    url_token: "WOwujTStcNLXhtBDsXoABxZYUu96ZgTORHhUT8EVRee7U"
}])

JobsApplicantsPipeline.create([{
    jobs_applicant_id: 1,
    pipeline_id: 1
},{
    jobs_applicant_id: 1,
    pipeline_id: 2
},{
    jobs_applicant_id: 2,
    pipeline_id: 3
},
{
    jobs_applicant_id: 2,
    pipeline_id: 4
},{
    jobs_applicant_id: 2,
    pipeline_id: 5
}])



