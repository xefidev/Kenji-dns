# Kenji DNS — Mobile App

Premium DNS app for iOS and Android. E-Sport × Liquid Glass aesthetic. Built with Flutter.

**Status:** 🚧 In development

## Stack
- Flutter 3.22+
- Dart 3.4+
- iOS 15+ / Android 9+ (API 28+)

## Quick start
```bash
flutter pub get
flutter run
```

## Project structure
```
lib/
  core/         — theme tokens, api client, secure storage
  features/
    auth/       — onboarding, code entry, success
    home/       — stats dashboard
    servers/    — DNS server list, upsell
    profile/    — profile, settings
  widgets/      — GlassCard, GlassButton, StatTile
  l10n/         — RU/EN/UA localization
```

## Design
See [SPEC.md](./SPEC.md) for full design + implementation spec.

## Build
APK and unsigned IPA are built automatically by GitHub Actions on every push to `main`. See [Releases](../../releases).

For signed iOS builds, an Apple Developer account ($99/year) and signing certificates in GitHub Secrets are required.

## Links
- Telegram bot: [@Kenjipay_bot](https://t.me/Kenjipay_bot)
- Channel: [@Kenji_wifi](https://t.me/Kenji_wifi)