cask 'rubymine' do
  version '2018.2,182.3911.41'
  sha256 '2057ec259e0eabbf11bca346646caad31c0b7fb1baff431e426b3ecaa7cb1dd5'

  url "https://download.jetbrains.com/ruby/RubyMine-#{version.before_comma}.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=RM&latest=true&type=release'
  name 'RubyMine'
  homepage 'https://www.jetbrains.com/ruby/'

  auto_updates true

  app 'RubyMine.app'

  uninstall_postflight do
    ENV['PATH'].split(File::PATH_SEPARATOR).map { |path| File.join(path, 'mine') }.each { |path| File.delete(path) if File.exist?(path) && File.readlines(path).grep(%r{# see com.intellij.idea.SocketLock for the server side of this interface}).any? }
  end

  zap trash: [
               "~/Library/Application Support/RubyMine#{version.major_minor}",
               "~/Library/Caches/RubyMine#{version.major_minor}",
               "~/Library/Logs/RubyMine#{version.major_minor}",
               "~/Library/Preferences/RubyMine#{version.major_minor}",
             ]
end
