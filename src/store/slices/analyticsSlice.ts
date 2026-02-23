import { createSlice, PayloadAction } from '@reduxjs/toolkit';

type DayStats = {
  date: string;
  completed: number;
  missed: number;
};

type AnalyticsState = {
  daily: DayStats[];
  streak: number;
};

const initialState: AnalyticsState = {
  daily: [],
  streak: 0,
};

const analyticsSlice = createSlice({
  name: 'analytics',
  initialState,
  reducers: {
    addDayStats: (state, action: PayloadAction<DayStats>) => {
      state.daily.push(action.payload);
    },
    setStreak: (state, action: PayloadAction<number>) => {
      state.streak = action.payload;
    },
  },
});

export const { addDayStats, setStreak } = analyticsSlice.actions;
export default analyticsSlice.reducer;
