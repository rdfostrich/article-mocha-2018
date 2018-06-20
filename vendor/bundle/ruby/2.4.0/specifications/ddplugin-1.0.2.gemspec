# -*- encoding: utf-8 -*-
# stub: ddplugin 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "ddplugin".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2018-03-31"
  s.description = "Provides plugin management for Ruby projects".freeze
  s.email = "denis.defreyne@stoneship.org".freeze
  s.extra_rdoc_files = ["LICENSE".freeze, "README.md".freeze, "NEWS.md".freeze]
  s.files = ["LICENSE".freeze, "NEWS.md".freeze, "README.md".freeze]
  s.homepage = "http://github.com/ddfreyne/ddplugin/".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.3".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Plugins for Ruby apps".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.13"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.13"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.13"])
  end
end
