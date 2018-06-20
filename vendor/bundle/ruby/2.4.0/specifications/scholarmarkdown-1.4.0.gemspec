# -*- encoding: utf-8 -*-
# stub: scholarmarkdown 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "scholarmarkdown".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ruben Taelman".freeze]
  s.date = "2018-06-05"
  s.email = "rubensworks@gmail.com".freeze
  s.executables = ["generate-scholarmarkdown".freeze]
  s.extra_rdoc_files = ["LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["LICENSE.txt".freeze, "README.md".freeze, "bin/generate-scholarmarkdown".freeze]
  s.homepage = "http://github.com/rubensworks/ScholarMarkdown".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A framework for writing markdown-based scholarly articles.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<bibtex-ruby>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<latex-decode>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<citeproc-ruby>.freeze, [">= 1.1.6"])
      s.add_runtime_dependency(%q<csl-styles>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<bibmarkdown>.freeze, ["~> 2.0.0"])
      s.add_runtime_dependency(%q<katex>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<sskatex>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<execjs>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<therubyracer>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
    else
      s.add_dependency(%q<i18n>.freeze, [">= 0"])
      s.add_dependency(%q<bibtex-ruby>.freeze, [">= 0"])
      s.add_dependency(%q<latex-decode>.freeze, [">= 0"])
      s.add_dependency(%q<citeproc-ruby>.freeze, [">= 1.1.6"])
      s.add_dependency(%q<csl-styles>.freeze, [">= 0"])
      s.add_dependency(%q<bibmarkdown>.freeze, ["~> 2.0.0"])
      s.add_dependency(%q<katex>.freeze, [">= 0"])
      s.add_dependency(%q<sskatex>.freeze, [">= 0"])
      s.add_dependency(%q<execjs>.freeze, [">= 0"])
      s.add_dependency(%q<therubyracer>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
    end
  else
    s.add_dependency(%q<i18n>.freeze, [">= 0"])
    s.add_dependency(%q<bibtex-ruby>.freeze, [">= 0"])
    s.add_dependency(%q<latex-decode>.freeze, [">= 0"])
    s.add_dependency(%q<citeproc-ruby>.freeze, [">= 1.1.6"])
    s.add_dependency(%q<csl-styles>.freeze, [">= 0"])
    s.add_dependency(%q<bibmarkdown>.freeze, ["~> 2.0.0"])
    s.add_dependency(%q<katex>.freeze, [">= 0"])
    s.add_dependency(%q<sskatex>.freeze, [">= 0"])
    s.add_dependency(%q<execjs>.freeze, [">= 0"])
    s.add_dependency(%q<therubyracer>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<juwelier>.freeze, ["~> 2.4.7"])
  end
end
