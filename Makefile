precompile-stg:
	RAILS_ENV=staging bin/rails assets:precompile

precompile-prod:
	RAILS_ENV=production bin/rails assets:precompile

restart-stg:
	systemctl restart puma-stg.service

restart-prod:
	systemctl restart puma-prod.service
