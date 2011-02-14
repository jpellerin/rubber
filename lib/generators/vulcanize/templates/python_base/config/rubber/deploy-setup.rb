namespace :rubber do
  namespace :base do
    task :install_rvm do
      # nop
    end

    task :install_rvm_ruby do
      # nop
    end
  end

  namespace :python do
    namespace :base do
      # python initial config: set up virtual env
      before "rubber:setup_gem_sources", "rubber:python:base:setup_virtualenv"
      task :setup_virtualenv, :roles => :python do
        # XXX install virtualenv
        run "mkvirtualenv env"
      end

      task :install_dependencies, :roles => :python do
        # XXX pip install -r ...
        run "./env/pip install -r #{rubber_env.pip_requirements}"
      end
    end
  end
end
