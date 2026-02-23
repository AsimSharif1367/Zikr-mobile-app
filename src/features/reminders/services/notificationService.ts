import * as Notifications from 'expo-notifications';

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: true,
    shouldSetBadge: false,
  }),
});

export const notificationService = {
  async requestPermission(): Promise<boolean> {
    const response = await Notifications.requestPermissionsAsync();
    return response.granted;
  },
  async scheduleInMinutes(title: string, body: string, minutes: number): Promise<string> {
    return Notifications.scheduleNotificationAsync({
      content: { title, body },
      trigger: { seconds: minutes * 60 },
    });
  },
  async cancel(notificationId: string): Promise<void> {
    await Notifications.cancelScheduledNotificationAsync(notificationId);
  },
};
