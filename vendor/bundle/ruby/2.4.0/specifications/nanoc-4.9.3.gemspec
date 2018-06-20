# -*- encoding: utf-8 -*-
# stub: nanoc 4.9.3 ruby lib

Gem::Specification.new do |s|
  s.name = "nanoc".freeze
  s.version = "4.9.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2018-06-09"
  s.description = "Nanoc is a static-site generator focused on flexibility. It transforms content from a format such as Markdown or AsciiDoc into another format, usually HTML, and lays out pages consistently to retain the site\u2019s look and feel throughout. Static sites built with Nanoc can be deployed to any web server.".freeze
  s.email = "denis+rubygems@denis.ws".freeze
  s.executables = ["nanoc".freeze]
  s.files = ["bin/nanoc".freeze]
  s.homepage = "http://nanoc.ws/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.3".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A static-site generator with a focus on flexibility.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_runtime_dependency(%q<cri>.freeze, ["~> 2.8"])
      s.add_runtime_dependency(%q<ddmemoize>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<ddmetrics>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<ddplugin>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<hamster>.freeze, ["~> 3.0"])
      s.add_runtime_dependency(%q<parallel>.freeze, ["~> 1.12"])
      s.add_runtime_dependency(%q<ref>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<slow_enumerator_tools>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
    else
      s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
      s.add_dependency(%q<cri>.freeze, ["~> 2.8"])
      s.add_dependency(%q<ddmemoize>.freeze, ["~> 1.0"])
      s.add_dependency(%q<ddmetrics>.freeze, ["~> 1.0"])
      s.add_dependency(%q<ddplugin>.freeze, ["~> 1.0"])
      s.add_dependency(%q<hamster>.freeze, ["~> 3.0"])
      s.add_dependency(%q<parallel>.freeze, ["~> 1.12"])
      s.add_dependency(%q<ref>.freeze, ["~> 2.0"])
      s.add_dependency(%q<slow_enumerator_tools>.freeze, ["~> 1.0"])
      s.add_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
    end
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
    s.add_dependency(%q<cri>.freeze, ["~> 2.8"])
    s.add_dependency(%q<ddmemoize>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ddmetrics>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ddplugin>.freeze, ["~> 1.0"])
    s.add_dependency(%q<hamster>.freeze, ["~> 3.0"])
    s.add_dependency(%q<parallel>.freeze, ["~> 1.12"])
    s.add_dependency(%q<ref>.freeze, ["~> 2.0"])
    s.add_dependency(%q<slow_enumerator_tools>.freeze, ["~> 1.0"])
    s.add_dependency(%q<tomlrb>.freeze, ["~> 1.2"])
  end
end
