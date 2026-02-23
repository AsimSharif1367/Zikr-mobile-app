# Zikr Reminder App Architecture

## Stack
- Expo + React Native + TypeScript
- Redux Toolkit for state
- AsyncStorage for local persistence
- Expo Notifications for reminders

## Layering
- `src/features`: domain-based modules
- `src/services`: shared infrastructure services
- `src/store`: app state and slices
- `src/navigation`: stack + tabs routing

## Feature Mapping
- Zikr Notifications: `features/reminders`
- Custom Zikr: `features/zikr`
- Tasbeeh Counter: `features/counter`
- History & Analytics: `features/analytics`
- Notification Management & preferences: `features/settings`
