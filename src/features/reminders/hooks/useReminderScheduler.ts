import { useCallback } from 'react';
import { notificationService } from '../services/notificationService';

export function useReminderScheduler() {
  const scheduleReminder = useCallback(async (title: string, body: string, intervalMinutes: number) => {
    return notificationService.scheduleInMinutes(title, body, intervalMinutes);
  }, []);

  const cancelReminder = useCallback(async (notificationId: string) => {
    await notificationService.cancel(notificationId);
  }, []);

  return {
    scheduleReminder,
    cancelReminder,
  };
}
