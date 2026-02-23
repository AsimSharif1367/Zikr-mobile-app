# Zikr Reminder App

A mobile app scaffold for zikr reminders, custom zikr creation, tasbeeh counting, and streak tracking.

## Quick Start

1. Install dependencies:
   - `npm install`
2. Run app:
   - `npm run start`

## Project Structure

- `src/features`: business modules (zikr, reminders, counter, analytics, settings, auth)
- `src/navigation`: stack/tab navigation
- `src/store`: Redux slices/state
- `src/services`: storage and sync services
- `src/i18n`: localization resources
- `docs`: architecture and product docs

## Next Build Steps

- Wire actual reminder scheduling modes (interval/specific/random)
- Add completed/missed tracking from notification actions
- Persist slices to AsyncStorage
- Add login providers (Google/Apple) if needed
