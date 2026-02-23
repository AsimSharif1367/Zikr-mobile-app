import { createSlice, PayloadAction } from '@reduxjs/toolkit';

type SettingsState = {
  notificationsEnabled: boolean;
  darkMode: boolean;
  language: 'en' | 'ar';
  quietHoursStart: string;
  quietHoursEnd: string;
  reminderSound: 'default' | 'soft' | 'none';
};

const initialState: SettingsState = {
  notificationsEnabled: true,
  darkMode: false,
  language: 'en',
  quietHoursStart: '23:00',
  quietHoursEnd: '06:00',
  reminderSound: 'default',
};

const settingsSlice = createSlice({
  name: 'settings',
  initialState,
  reducers: {
    updateSettings: (state, action: PayloadAction<Partial<SettingsState>>) => ({
      ...state,
      ...action.payload,
    }),
  },
});

export const { updateSettings } = settingsSlice.actions;
export default settingsSlice.reducer;
