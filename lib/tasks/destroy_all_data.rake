namespace :destroy_all_data do
    desc "destroy all records"
    task destroy: :environment do
        Participant.destroy_all
        puts "All records destroyed successfully."
    end
end