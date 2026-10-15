cask "githubmonitor" do
  version "2.1.0"
  sha256 "285fb8a851048b23f1f8411d3a33cb4bfa1aca57e40823f87f1c85423e129edc"

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
