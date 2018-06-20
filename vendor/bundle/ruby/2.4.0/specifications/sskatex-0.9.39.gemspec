# -*- encoding: utf-8 -*-
# stub: sskatex 0.9.39 ruby lib

Gem::Specification.new do |s|
  s.name = "sskatex".freeze
  s.version = "0.9.39"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Christian Cornelssen".freeze]
  s.date = "2018-01-27"
  s.description = "This is a TeX-to-HTML+MathML+CSS converter class using the Javascript-based\nKaTeX, interpreted by one of the Javascript engines supported by ExecJS.\nThe intended purpose is to eliminate the need for math-rendering Javascript\nin the client's HTML browser. Therefore the name: SsKaTeX means Server-side\nKaTeX.\n\nJavascript execution context initialization can be done once and then reused\nfor formula renderings with the same general configuration. As a result, the\nperformance is reasonable.\n\nThe configuration supports arbitrary locations of the external file katex.min.js\nas well as custom Javascript for pre- and postprocessing.\nFor that reason, the configuration must not be left to untrusted users.\n".freeze
  s.email = "ccorn@1tein.de".freeze
  s.executables = ["sskatex".freeze]
  s.files = ["bin/sskatex".freeze]
  s.homepage = "https://github.com/ccorn/sskatex".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["-a".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1".freeze)
  s.requirements = ["Javascript engine supported by the ExecJS gem".freeze, "Some KaTeX release".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Server-side KaTeX for Ruby".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<execjs>.freeze, ["~> 2.7"])
      s.add_development_dependency(%q<duktape>.freeze, [">= 1.6.1", "~> 1.6"])
    else
      s.add_dependency(%q<execjs>.freeze, ["~> 2.7"])
      s.add_dependency(%q<duktape>.freeze, [">= 1.6.1", "~> 1.6"])
    end
  else
    s.add_dependency(%q<execjs>.freeze, ["~> 2.7"])
    s.add_dependency(%q<duktape>.freeze, [">= 1.6.1", "~> 1.6"])
  end
end
