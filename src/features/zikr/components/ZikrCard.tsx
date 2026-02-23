import React from 'react';
import { Pressable, StyleSheet, Text, View } from 'react-native';
import { ZikrItem } from '@/types/domain';

type ZikrCardProps = {
  item: ZikrItem;
  onPress: () => void;
};

export function ZikrCard({ item, onPress }: ZikrCardProps): React.JSX.Element {
  return (
    <Pressable onPress={onPress} style={styles.card}>
      <View>
        <Text style={styles.name}>{item.name}</Text>
        {item.arabicText ? <Text style={styles.arabic}>{item.arabicText}</Text> : null}
        {item.translation ? <Text style={styles.translation}>{item.translation}</Text> : null}
      </View>
      <Text style={styles.target}>Goal: {item.targetCount}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  card: {
    borderWidth: 1,
    borderColor: '#E5E7EB',
    borderRadius: 12,
    padding: 14,
    marginBottom: 12,
    gap: 8,
  },
  name: {
    fontWeight: '700',
    fontSize: 16,
  },
  arabic: {
    fontSize: 18,
    textAlign: 'right',
  },
  translation: {
    color: '#6B7280',
  },
  target: {
    fontWeight: '600',
    color: '#2D7B57',
  },
});
