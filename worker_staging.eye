Eye.config do
	logger "/tmp/eye.log"
end

Eye.application("czepa_hlasovani") do |app|
	process :worker do
		working_dir "/var/data/staging/anubadesign/czepa.cz.hlasovani/current"
		pid_file "/var/data/staging/anubadesign/czepa.cz.hlasovani/current/worker.pid"
		stdall "/var/data/staging/anubadesign/czepa.cz.hlasovani/current/log/worker.log"
		env "RAILS_ENV" => "staging"
		start_command "bundle exec rake qc:work"
		daemonize true
	end
end
