import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Screen } from '@/components/common/Screen';
import { useAppSelector } from '@/hooks/useAppSelector';

export function AnalyticsScreen(): React.JSX.Element {
  const streak = useAppSelector((state) => state.analytics.streak);
  const daily = useAppSelector((state) => state.analytics.daily);

  return (
    <Screen>
      <View style={styles.container}>
        <Text style={styles.heading}>History & Analytics</Text>
        <Text>Current streak: {streak} day(s)</Text>
        <Text>Tracked days: {daily.length}</Text>
        <Text>Most used zikr: TODO</Text>
      </View>
    </Screen>
  );
}

const styles = StyleSheet.create({
  container: {
    gap: 10,
  },
  heading: {
    fontSize: 20,
    fontWeight: '700',
  },
});
