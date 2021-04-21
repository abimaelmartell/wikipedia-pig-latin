namespace :articles do
  desc "Clear fetched articles from Wikipedia"
  task clear: :environment do
    Rails.logger.info "Deleting all fetched articles..."
    Article.destroy_all
  end
end
