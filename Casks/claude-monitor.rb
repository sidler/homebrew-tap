cask "claude-monitor" do
  version "1.0.1"
  sha256 "8033993fcc667eb72546b8c4c9a7ce28561dec8ae756bb4a63c574f714a1763d"

  url "https://github.com/sidler/ClaudeMenuBarMonitor/releases/download/v#{version}/ClaudeMonitor-#{version}.zip"
  name "Claude Monitor"
  desc "Menu bar app for the Claude Code sessions running on this Mac"
  homepage "https://github.com/sidler/ClaudeMenuBarMonitor"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app draws with the system's own glass materials rather than reproducing
  # them, which is why it asks for a recent macOS. A bare symbol means "this or
  # newer": Homebrew parses the value with a ">=" comparator.
  depends_on macos: :golden_gate

  app "ClaudeMonitor.app"

  # ~/.claude/monitor is deliberately left alone. It holds the hook script that
  # ~/.claude/settings.json points at, and removing the script while the entry
  # stays would leave Claude Code calling a file that is not there. Take the
  # hooks out from the app's Settings before uninstalling.
  zap trash: [
    "~/Library/Preferences/com.sidler.claudemonitor.plist",
    "~/Library/Caches/com.sidler.claudemonitor",
  ]
end
