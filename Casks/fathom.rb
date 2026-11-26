# Homebrew cask for Fathom. Lives in the tap repo github.com/jarope/homebrew-fathom
# as Casks/fathom.rb, so people can:   brew install jarope/fathom/fathom
# release.sh --publish updates version + sha256 here and in the tap.
cask "fathom" do
  version "0.36.0"
  sha256 "800f006b1a2a33f5d9c6664706ccd35d71cb1412c20bf9beac8ef828bada9742"

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
