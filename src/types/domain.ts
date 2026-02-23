export type ZikrItem = {
  id: string;
  name: string;
  arabicText?: string;
  translation?: string;
  targetCount: number;
  isReminderEnabled: boolean;
};

export type ReminderMode = 'interval' | 'specific-time' | 'random';

export type ReminderItem = {
  id: string;
  zikrId: string;
  mode: ReminderMode;
  intervalMinutes?: number;
  specificTimes?: string[];
  randomWindowMinutes?: number;
  isActive: boolean;
};
