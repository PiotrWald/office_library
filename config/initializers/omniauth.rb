OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :google_oauth2,
		'825520494430-7tggqcq59s340dhqh7m0r170pb400ebs.apps.googleusercontent.com',
		'xlbVLDa3UgYYicEYJL8obknH',
		{client_options: {ssl: {
			ca_file: Rails.root.join("cacert.pem").to_s
		}}}

end