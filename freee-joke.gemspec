Gem::Specification.new do |spec|
  spec.name = "freee-joke"
  spec.version = "0.0.1"
  spec.authors = ["freee corp."]
  spec.email = ["tadashi-tada@freee.co.jp"]

  spec.summary = %q{A joke program like "sl".}
  spec.description = %q{A joke program like the "sl" command that is executed when you mistype "free" for "freee".}
  spec.homepage = "https://github.com/freee/freee"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_runtime_dependency "curses"

  spec.add_development_dependency "rake"
end
