import { configureStore } from '@reduxjs/toolkit';
import zikrReducer from './slices/zikrSlice';
import reminderReducer from './slices/reminderSlice';
import analyticsReducer from './slices/analyticsSlice';
import settingsReducer from './slices/settingsSlice';

export const store = configureStore({
  reducer: {
    zikr: zikrReducer,
    reminders: reminderReducer,
    analytics: analyticsReducer,
    settings: settingsReducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
