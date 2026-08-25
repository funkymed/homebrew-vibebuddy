cask "vibebuddy" do
  version "1.0.0"
  sha256 "fbc26aafc95e8cc9e06ed671d73bf0906796d546818edcff4255afd55ce6e69c"

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
