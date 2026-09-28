cask "githubmonitor" do
  version "0.1.0"
  sha256 "2db32aee1b8bf26f6f5dfbb996a5aac1c3a05df568fbc6451816c4766ad8dc6a"

  url "https://github.com/sidler/GitHubMonitor/releases/download/v#{version}/GitHubMonitor-#{version}.zip",
      verified: "github.com/sidler/GitHubMonitor/"
  name "GitHub Monitor"
  desc "Menu bar app for the GitHub work waiting on you"
  homepage "https://github.com/sidler/GitHubMonitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app draws with the system's own glass materials rather than
  # reproducing them, which is why it asks for a recent macOS.
  depends_on macos: ">= :tahoe"

  app "GitHubMonitor.app"

  # The token lives in the keychain, which `zap` cannot reach: removing it
  # means deleting the "com.sidler.githubmonitor" entry in Keychain Access.
  zap trash: [
    "~/Library/Preferences/com.sidler.githubmonitor.plist",
    "~/Library/Caches/com.sidler.githubmonitor",
    "~/Library/Application Support/GitHubMonitor",
  ]
end
