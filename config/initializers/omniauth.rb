Rails.application.config.middleware.use OmniAuth::Builder do

  # Use test apps for login if in dev or cert environments
  if Rails.env == 'development' or Rails.env == 'certification'
    provider :facebook, '130205940461631', '0bd1536a7546c0b9d9d066e703138018'
    provider :twitter, 'KBoQcv5ZIAIUJkUDFqqr5A', 'LW63ap2UYMogKQKqRztWk2VjGoMbS1lDaPJCJxHCU'
  else
    provider :facebook, '', ''
    provider :twitter, '', ''
  end
end