import { createSlice, nanoid, PayloadAction } from '@reduxjs/toolkit';
import { ZikrItem } from '@/types/domain';

type ZikrState = {
  items: ZikrItem[];
};

const initialState: ZikrState = {
  items: [
    {
      id: 'default-1',
      name: 'Subhanallah',
      arabicText: 'سُبْحَانَ ٱللَّٰهِ',
      translation: 'Glory be to Allah',
      targetCount: 33,
      isReminderEnabled: true,
    },
  ],
};

const zikrSlice = createSlice({
  name: 'zikr',
  initialState,
  reducers: {
    addZikr: {
      reducer: (state, action: PayloadAction<ZikrItem>) => {
        state.items.push(action.payload);
      },
      prepare: (item: Omit<ZikrItem, 'id'>) => ({
        payload: { ...item, id: nanoid() },
      }),
    },
    updateZikr: (state, action: PayloadAction<ZikrItem>) => {
      const index = state.items.findIndex((entry) => entry.id === action.payload.id);
      if (index >= 0) {
        state.items[index] = action.payload;
      }
    },
    deleteZikr: (state, action: PayloadAction<string>) => {
      state.items = state.items.filter((entry) => entry.id !== action.payload);
    },
  },
});

export const { addZikr, updateZikr, deleteZikr } = zikrSlice.actions;
export default zikrSlice.reducer;
