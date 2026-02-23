import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Button } from '@/components/common/Button';
import { useCounter } from '../hooks/useCounter';

type TasbeehCounterProps = {
  target: number;
};

export function TasbeehCounter({ target }: TasbeehCounterProps): React.JSX.Element {
  const { count, increment, reset, isGoalReached } = useCounter(target);

  return (
    <View style={styles.container}>
      <Text style={styles.count}>{count}</Text>
      <Text style={styles.target}>Goal: {target}</Text>
      {isGoalReached ? <Text style={styles.success}>MashaAllah! Goal reached.</Text> : null}
      <View style={styles.actions}>
        <Button title="Count" onPress={increment} />
        <Button title="Reset" onPress={reset} />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    gap: 12,
    alignItems: 'center',
  },
  count: {
    fontSize: 52,
    fontWeight: '700',
  },
  target: {
    fontSize: 16,
  },
  success: {
    color: '#2D7B57',
    fontWeight: '600',
  },
  actions: {
    width: '100%',
    gap: 10,
  },
});
