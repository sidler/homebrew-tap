cask "githubmonitor" do
  version "1.6.1"
  sha256 "191b79a1c447fd0578c524dfcd0a9249f1c6456635788ccb0b69070653fb5afc"

  url "https://github.com/sidler/GitHubMonitor/releases/download/v#{version}/GitHubMonitor-#{version}.zip"
  name "GitHub Monitor"
  desc "Menu bar app for the GitHub work waiting on you"
  homepage "https://github.com/sidler/GitHubMonitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app draws with the system's own glass materials rather than
  # reproducing them, which is why it asks for a recent macOS. A bare
  # symbol means "this or newer": Homebrew parses the value with a ">="
  # comparator.
  depends_on macos: :tahoe

  app "GitHubMonitor.app"

  # The token lives in the keychain, which `zap` cannot reach: removing it
  # means deleting the "com.sidler.githubmonitor" entry in Keychain Access.
  zap trash: [
    "~/Library/Preferences/com.sidler.githubmonitor.plist",
    "~/Library/Caches/com.sidler.githubmonitor",
    "~/Library/Application Support/GitHubMonitor",
  ]
end
