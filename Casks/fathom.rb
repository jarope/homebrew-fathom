# Homebrew cask for Fathom. Lives in the tap repo github.com/jarope/homebrew-fathom
# as Casks/fathom.rb, so people can:   brew install jarope/fathom/fathom
# release.sh --publish updates version + sha256 here and in the tap.
cask "fathom" do
  version "0.35.0"
  sha256 "84e1d2fa4ac33a54a1fa4cf14dafd6ede95d57517c49d443b477f500ed12c15e"

  url "https://github.com/jarope/fathom/releases/download/v#{version}/Fathom_#{version}_universal.dmg"
  name "Fathom"
  desc "Twin-pane file manager with Dolphin's features and Spotlight search"
  homepage "https://github.com/jarope/fathom"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Fathom.app"

  # Fathom isn't notarised (no Apple Developer account, by choice), so let macOS open it
  # without the "can't check it for malicious software" block.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Fathom.app"],
        writable_paths: ["Fathom.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/.config/fathom",
    "~/Library/Application Support/uk.jrpc.fathom",
    "~/Library/Caches/fathom",
    "~/Library/Caches/uk.jrpc.fathom",
    "~/Library/Saved Application State/uk.jrpc.fathom.savedState",
    "~/Library/WebKit/fathom",
    "~/Library/WebKit/uk.jrpc.fathom",
  ]
end
