# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name = 'hexlet_code'
  spec.version = HexletCode::VERSION
  spec.authors = ['Kaniev Gregory']
  spec.email = ['kanigreg@gmail.com']

  spec.summary = 'Generate forms.'
  spec.description = 'Create forms writing less code.'
  spec.homepage = 'https://github.com/kanigreg/rails-project-63'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.2'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/kanigreg/rails-project-63'
  spec.metadata['changelog_uri'] = 'https://github.com/kanigreg/rails-project-63'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
