cask "vibebuddy" do
  version "1.2.0"
  sha256 "89d63157a4981442038b291b84df8dde8d492e0173a709572786ca00034a982f"

  url "https://github.com/funkymed/VibeBuddy/releases/download/v#{version}/VibeBuddy-#{version}.dmg"
  name "VibeBuddy"
  desc "Turns the MacBook notch into a dashboard for your coding agents"
  homepage "https://github.com/funkymed/VibeBuddy"

  depends_on macos: :sonoma

  app "VibeBuddy.app"

  # Signed with a stable self-signed identity, not notarised. Homebrew adds the
  # quarantine attribute, and Homebrew 6 dropped --no-quarantine. After
  # installing:
  #   xattr -dr com.apple.quarantine /Applications/VibeBuddy.app

  # The app never removes its hook on its own, and neither can the cask: it would
  # have to run the binary it is deleting, with nobody there to confirm.
  caveats <<~EOS
    Permission requests reach the notch only once the hook is installed:
      Settings › Permissions › Claude Code › Install…
    Before uninstalling, remove it from the same place, or Claude Code keeps
    calling a vibe-hook that no longer exists.
  EOS

  zap trash: [
    "~/Library/Application Support/VibeBuddy",
    "~/Library/Preferences/fr.funkylab.vibebuddy.plist",
    "~/.vibebuddy",
  ]
end
