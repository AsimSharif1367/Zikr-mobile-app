import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Screen } from '@/components/common/Screen';
import { Button } from '@/components/common/Button';
import { useAppDispatch } from '@/hooks/useAppDispatch';
import { useAppSelector } from '@/hooks/useAppSelector';
import { updateSettings } from '@/store/slices/settingsSlice';

export function SettingsScreen(): React.JSX.Element {
  const dispatch = useAppDispatch();
  const settings = useAppSelector((state) => state.settings);

  return (
    <Screen>
      <View style={styles.container}>
        <Text style={styles.heading}>Settings</Text>
        <Text>Notifications: {settings.notificationsEnabled ? 'Enabled' : 'Disabled'}</Text>
        <Text>Quiet hours: {settings.quietHoursStart} - {settings.quietHoursEnd}</Text>
        <Text>Language: {settings.language}</Text>
        <Text>Dark mode: {settings.darkMode ? 'On' : 'Off'}</Text>
        <Button
          title={settings.notificationsEnabled ? 'Pause Reminders' : 'Enable Reminders'}
          onPress={() => dispatch(updateSettings({ notificationsEnabled: !settings.notificationsEnabled }))}
        />
      </View>
    </Screen>
  );
}

const styles = StyleSheet.create({
  container: {
    gap: 10,
  },
  heading: {
    fontWeight: '700',
    fontSize: 20,
  },
});
