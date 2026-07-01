cask "cliplex" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/Ron537/Cliplex/releases/download/v#{version}/Cliplex-#{version}.dmg"
  name "Cliplex"
  desc "Fast, private, native clipboard manager — history, snippets & quick actions"
  homepage "https://github.com/Ron537/Cliplex"

  depends_on macos: :sonoma

  app "Cliplex.app"

  caveats <<~EOS
    Cliplex is ad-hoc signed (free, not notarized), so on first launch macOS may
    say it "could not verify" the app. Approve it once via
      System Settings → Privacy & Security → Open Anyway
    or run:
      xattr -dr com.apple.quarantine "#{appdir}/Cliplex.app"

    Auto-paste needs Accessibility permission
      (System Settings → Privacy & Security → Accessibility).
  EOS

  zap trash: [
    "~/Library/Application Support/com.ron537.cliplex",
    "~/Library/Preferences/com.ron537.cliplex.plist",
  ]
end
