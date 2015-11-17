module Mkgem
  class Cli < Thor::Group
    include Thor::Actions

    desc 'Creates a new Ruby gem'
    argument :name, type: :string, desc: 'Name of new gem'

    def self.source_root
      File.expand_path('../../../templates', __FILE__)
    end

    def setup
      @name = name.underscore
    end

    def create_dir
      directory 'gem', name
    end

    def set_permissions
      inside(name) do
        chmod 'bin/console', 'a+x'
      end
    end

    def init_git_repo
      inside(name) do
        run('git init .')
      end
    end

    def install_deps
      inside(name) do
        run('bundle')
      end
    end
  end
end
