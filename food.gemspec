lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "food/version"

Gem::Specification.new do |spec|
  spec.name          = "food"
  spec.version       = Food::VERSION
  spec.authors       = ["Eduardo Suarez Ojeda"]
  spec.email         = ["alu0100896565@ull.edu.es"]

  spec.summary       = %q{Practica 6. Lenguajes y Paradigmas de Programacion}
  spec.description   = %q{Programa para analizar el estado nutricional e impacto ambiental de la dieta de hombre y mujer entre 20-39 años}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100896565"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100896565"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100896565"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100896565"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
