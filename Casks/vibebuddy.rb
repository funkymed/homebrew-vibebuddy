cask "vibebuddy" do
  version "0.1.0"
  sha256 "fedeee678dfcd70805993c07b4a9763a48fdae0c0bace7b62cd76c1872857cbe"

  url "https://github.com/funkymed/VibeBuddy/releases/download/v#{version}/VibeBuddy-#{version}.dmg"
  name "VibeBuddy"
  desc "Turns the MacBook notch into a dashboard for your coding agents"
  homepage "https://github.com/funkymed/VibeBuddy"

  depends_on macos: ">= :sonoma"

  app "VibeBuddy.app"

  # Signed with a stable self-signed identity, not notarised: Gatekeeper would
  # refuse the first launch. Homebrew removes the quarantine attribute itself,
  # which is the friction this cask exists to remove.

  zap trash: [
    "~/Library/Application Support/VibeBuddy",
    "~/Library/Preferences/fr.funkylab.vibebuddy.plist",
    "~/.vibebuddy",
  ]
end
