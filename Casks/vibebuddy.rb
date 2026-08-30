cask "vibebuddy" do
  version "1.0.1"
  sha256 "146e7e11d9ca3fa6f5f1b4bc9dbf88fcd3860ab67ec269e28d6ecbcdd4b21895"

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
