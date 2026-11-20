# Homebrew tap for Fathom

[Fathom](https://github.com/jarope/fathom) is a twin-pane file manager for
macOS with the best of KDE Dolphin: tabs, split view, a folder shelf,
Spotlight search, Git badges and your own right-click actions.

```sh
brew tap jarope/fathom
brew trust jarope/fathom      # Homebrew 7+ asks you to trust third-party taps once
brew install --cask fathom
```

Fathom keeps itself up to date (Preferences → Updates); `brew upgrade` works
too. `brew uninstall --zap fathom` also removes its settings.

The cask is updated automatically by Fathom's release script.
