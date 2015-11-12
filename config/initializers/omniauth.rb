OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "778bplq3s9yqyy", "rWnHy2twBFH2vB3h"
end