cask "vibebuddy" do
  version "0.4.1"
  sha256 "02e3a4b21e8197f14d3973b96b0f104e82cfe85a8d286cfd0b8403f0872c85f8"

  url "https://github.com/funkymed/VibeBuddy/releases/download/v#{version}/VibeBuddy-#{version}.dmg"
  name "VibeBuddy"
  desc "Turns the MacBook notch into a dashboard for your coding agents"
  homepage "https://github.com/funkymed/VibeBuddy"

  depends_on macos: ">= :sonoma"

  app "VibeBuddy.app"

  # Signed with a stable self-signed identity, not notarised. Homebrew adds the
  # quarantine attribute, and Homebrew 6 dropped --no-quarantine. After
  # installing:
  #   xattr -dr com.apple.quarantine /Applications/VibeBuddy.app

  zap trash: [
    "~/Library/Application Support/VibeBuddy",
    "~/Library/Preferences/fr.funkylab.vibebuddy.plist",
    "~/.vibebuddy",
  ]
end
