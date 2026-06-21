# Kenji DNS — Mobile App Spec

Version: 0.1
Stack: Flutter (iOS 15+ / Android 9+)
Design system: Liquid Glass x E-Sport

## 1. Concept
Premium DNS app, e-sport aesthetic. Dark base, sharp neon accent, aggressive typography, HUD elements, Liquid Glass surfaces. Gaming-grade tool, not toy.

## 2. Design Tokens

Colors:
- bg-base #0A0B0F
- bg-surface #12141A
- bg-elevated #1A1D26
- glass-tint rgba(255,255,255,0.04)
- glass-stroke rgba(255,255,255,0.08)
- glass-blur 24px
- accent #00E5FF
- accent-glow rgba(0,229,255,0.35)
- accent-dim #008B9E
- text-primary #F5F7FA
- text-secondary #8A91A0
- text-muted #4A5060
- success #00FF94
- warning #FFB800
- danger #FF2D55
- lock #4A5060

Typography:
- Display: Space Grotesk / Geist 600-700, tracking -0.04em, line-height 0.95
- Body: Geist 400/500
- Mono/Stats: JetBrains Mono
- Sizes: Display 40/48/56 · H1 28 · H2 22 · H3 18 · Body 15 · Caption 12 · Mono 32

Radii/spacing: cards 20, buttons 14, pills 999. Scale 4/8/12/16/24/32/48.

Liquid Glass surface recipe:
- bg glass-tint
- backdrop-filter blur(24) saturate(140%)
- 1px glass-stroke border
- inset 0 1px 0 rgba(255,255,255,0.08) inner highlight
- accent glow when needed

## 3. Animation
Springs (stiffness 180, damping 22). Animate transform/opacity only. Tap scale 0.97 80ms. Page transitions shared-axis 280ms. Confetti + haptics only on auth success. Respect Reduce Motion.

## 4. Navigation
Root -> AuthGate -> MainShell or OnboardingFlow.
MainShell tabs: Home, Servers, Profile.

## 5. Screens

### 5.1 Welcome
Dark bg with subtle grid. Kenji logo top. Display Hi / This is Kenji DNS. Body explains Telegram bot login. Primary CTA Continue opens https://t.me/Kenjipay_bot.

### 5.2 Code Entry
6 OTP cells 56x56 mono. Active cell cyan glow. Auto-paste 6-digit clipboard. Error shake + red flash.
API: POST /auth/verify { code } -> { token, user, subscription }
403 not_subscribed_to_channel -> modal with @Kenji_wifi link.

### 5.3 Success
Confetti (cyan + white, 2s). Haptic medium x2. Big cyan checkmark. Current plan card. If FREE/PRO upsell + 2 buttons. If VIP single CTA.

### 5.4 Home
1. Header avatar + status indicator.
2. Hero stat: TOTAL TRAFFIC + 7-day sparkline.
3. Stat row: session time + current server.
4. Connection card with ON/OFF toggle, pulsing cyan ring when on.
5. Plan info row.
API: GET /stats/me -> { totalTrafficBytes, sessionMinutes, currentServerId, sparkline }

### 5.5 Servers
3 cards:
- Dns.Kenji-Wifi.FREE always available
- Dns.Kenji-Wifi.PRO requires PRO or VIP
- Dns.Kenji-Wifi.VIP requires VIP

States: available / active (cyan border + glow) / locked (opacity 0.6 + lock icon).
Tap locked -> bottom sheet upsell -> link to @Kenjipay_bot.
API: GET /servers, POST /servers/connect { serverId }

### 5.6 Profile
1. TG avatar (88px, cyan ring if VIP) + @username + name.
2. Plan card: label, name (cyan if PRO/VIP), Expires in N days.
3. Progress bar.
4. 2 buttons: Channel -> t.me/Kenji_wifi, Website -> {{WEBSITE_URL}}.
5. Settings row.
6. Logout (danger).

### 5.7 Settings
- General: language (RU/EN/UA), theme (Dark locked), haptics.
- Notifications: push, subscription reminders.
- Connection: autoconnect, kill switch (VIP only).
- About: version, Privacy, Terms, Support -> @Kenjipay_bot.

## 6. Telegram Integration
Bot @Kenjipay_bot. Channel @Kenji_wifi. Backend checks channel subscription via Telegram Bot API, issues JWT after code validation. Token stored in flutter_secure_storage.

## 7. Plans

| Plan | Description | Servers |
|---|---|---|
| FREE | Basic, up to 50 Mbps | FREE |
| PRO | Up to 200 Mbps, no ads | FREE + PRO |
| VIP | Unlimited, kill switch | All |

Pricing TBD, payment via @Kenjipay_bot.

## 8. Stack
flutter_riverpod, go_router, dio, flutter_secure_storage, url_launcher, confetti, cached_network_image, google_fonts, flutter_animate, shimmer, fl_chart.

## 9. States per screen
loading (shimmer), empty, error, offline.

## 10. TBD
1. API_BASE
2. WEBSITE_URL
3. PRIVACY_URL, TERMS_URL
4. Pricing + payment method
5. Bot purchase deep-link
6. Kenji logo
7. DNS stats data source