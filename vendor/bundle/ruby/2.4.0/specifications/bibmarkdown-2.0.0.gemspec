# -*- encoding: utf-8 -*-
# stub: bibmarkdown 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bibmarkdown".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ruben Verborgh".freeze]
  s.date = "2018-05-22"
  s.email = "ruben@verborgh.org".freeze
  s.extra_rdoc_files = ["LICENSE.md".freeze, "README.md".freeze]
  s.files = ["LICENSE.md".freeze, "README.md".freeze]
  s.homepage = "http://github.com/RubenVerborgh/bibmarkdown".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Markdown with BibTeX citations.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<citeproc-ruby>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<csl-styles>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
    else
      s.add_dependency(%q<citeproc-ruby>.freeze, [">= 0"])
      s.add_dependency(%q<csl-styles>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
    end
  else
    s.add_dependency(%q<citeproc-ruby>.freeze, [">= 0"])
    s.add_dependency(%q<csl-styles>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
  end
end
