import React from 'react';
import { StyleSheet, Text, View } from 'react-native';

type EmptyStateProps = {
  title: string;
  subtitle?: string;
};

export function EmptyState({ title, subtitle }: EmptyStateProps): React.JSX.Element {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>{title}</Text>
      {subtitle ? <Text style={styles.subtitle}>{subtitle}</Text> : null}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 24,
  },
  title: {
    fontSize: 18,
    fontWeight: '600',
  },
  subtitle: {
    marginTop: 8,
    color: '#666',
    textAlign: 'center',
  },
});
