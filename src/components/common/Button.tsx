import React from 'react';
import { Pressable, StyleSheet, Text } from 'react-native';

type ButtonProps = {
  title: string;
  onPress: () => void;
};

export function Button({ title, onPress }: ButtonProps): React.JSX.Element {
  return (
    <Pressable style={styles.button} onPress={onPress}>
      <Text style={styles.label}>{title}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  button: {
    backgroundColor: '#2D7B57',
    borderRadius: 10,
    paddingHorizontal: 16,
    paddingVertical: 12,
    alignItems: 'center',
  },
  label: {
    color: '#FFFFFF',
    fontWeight: '600',
  },
});
