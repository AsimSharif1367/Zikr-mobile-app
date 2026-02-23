import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { ReminderItem } from '@/types/domain';

type ReminderState = {
  reminders: ReminderItem[];
  paused: boolean;
};

const initialState: ReminderState = {
  reminders: [],
  paused: false,
};

const reminderSlice = createSlice({
  name: 'reminders',
  initialState,
  reducers: {
    setReminders: (state, action: PayloadAction<ReminderItem[]>) => {
      state.reminders = action.payload;
    },
    pauseReminders: (state) => {
      state.paused = true;
    },
    resumeReminders: (state) => {
      state.paused = false;
    },
  },
});

export const { setReminders, pauseReminders, resumeReminders } = reminderSlice.actions;
export default reminderSlice.reducer;
