#!/usr/bin/env puma

# Restart the server with:
#   pumactl --config-file puma_config.rb restart

# Better explanations at:                  https://github.com/puma/puma/blob/3cbe5219a221cc5bdf4c1e0e8c37fc4ec8d83fce/examples/config.rb
# Executes in this obj (instance_evaled):  https://github.com/puma/puma/blob/3cbe5219a221cc5bdf4c1e0e8c37fc4ec8d83fce/lib/puma/configuration.rb#L158


# Setup paths
tmp_dir = File.join(__dir__, 'tmp')
Dir.mkdir(tmp_dir) unless Dir.exist? tmp_dir

# Serve from the root
directory(__dir__)

# This controls the server in the production environment (Amazon EC2)
environment('production')

# Daemonize the server
daemonize(true)
pidfile(   File.join(tmp_dir, 'puma.pid'))
state_path(File.join(tmp_dir, 'puma.state'))

# Logging
stdout_logfile  = File.join(tmp_dir, 'puma_out.log')
stderr_logfile  = File.join(tmp_dir, 'puma_err.log')
append_to_files = true
stdout_redirect(stdout_logfile, stderr_logfile, append_to_files)

# Serve on a socket so we don't need root access
# bind 'unix:///tmp/octo.sock'
bind 'tcp://0.0.0.0:80'
