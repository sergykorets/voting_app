Eye.config do
	logger "/tmp/eye.log"
end

Eye.application("czepa_hlasovani") do |app|
	process :worker do
		working_dir "/var/data/production/anubadesign/czepa.cz.hlasovani/current"
		pid_file "/var/data/production/anubadesign/czepa.cz.hlasovani/current/worker.pid"
		stdall "/var/data/production/anubadesign/czepa.cz.hlasovani/current/log/worker.log"
		env "RAILS_ENV" => "production"
		start_command "bundle exec rake qc:work"
		daemonize true
	end
end
