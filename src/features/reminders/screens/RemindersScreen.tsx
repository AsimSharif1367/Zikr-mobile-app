import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Screen } from '@/components/common/Screen';
import { Button } from '@/components/common/Button';
import { useReminderScheduler } from '../hooks/useReminderScheduler';

export function RemindersScreen(): React.JSX.Element {
  const { scheduleReminder } = useReminderScheduler();

  const onScheduleDemo = async () => {
    await scheduleReminder('Zikr Reminder', 'Remember to say Subhanallah', 20);
  };

  return (
    <Screen>
      <View style={styles.container}>
        <Text style={styles.title}>Zikr Notifications</Text>
        <Text style={styles.subtitle}>Set interval, specific-time, recurring, or random reminders.</Text>
        <Button title="Schedule 20-min demo reminder" onPress={onScheduleDemo} />
      </View>
    </Screen>
  );
}

const styles = StyleSheet.create({
  container: {
    gap: 12,
  },
  title: {
    fontWeight: '700',
    fontSize: 20,
  },
  subtitle: {
    color: '#6B7280',
  },
});
