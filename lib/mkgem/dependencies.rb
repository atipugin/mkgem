module Mkgem
  module Dependencies
    def self.[](name)
      JSON.parse(
        Net::HTTP.get(URI("https://rubygems.org/api/v1/gems/#{name}.json"))
      )['version'].split('.')[0..1].join('.').prepend('~> ')
    end
  end
end
