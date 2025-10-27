guard :rspec, cmd: 'bundle exec rspec --color' do
  watch(%r{^spec/.+_spec\.rb$}) { |m| m[0] }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('app.rb')               { 'spec' }
end

guard :shell, cmd: 'bundle exec cucumber --format progress' do
  watch(%r{^features/.+\.feature$}) { |m| m[0] }
  watch(%r{^features/.+\.rb$})      { 'features' }
  watch(%r{^(app|lib)/.+\.rb$})     { 'features' }
end
