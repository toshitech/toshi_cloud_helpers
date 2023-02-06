# frozen_string_literal: true

require_relative "lib/toshi_cloud_helpers/version"

Gem::Specification.new do |spec|
  spec.name = "toshi_cloud_helpers"
  spec.version = ToshiCloudHelpers::VERSION
  spec.authors = ["Chris Hopkins"]
  spec.email = ["42541529+chris-john-hopkins@users.noreply.github.com"]

  spec.summary = "A gem to provide access to different resources/databases within our cloud functions"
  spec.description = "A gem to provide access to different resources/databases within our cloud functions"
  spec.homepage = "https://github.com/toshitech/toshi_cloud_helpers"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/toshitech/toshi_cloud_helpers"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/toshitech/toshi_cloud_helpers"
  spec.metadata["changelog_uri"] = "https://github.com/toshitech/toshi_cloud_helpers"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_dependency "mongo"
  spec.add_dependency "pg"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
