import React from 'react';
import { StyleSheet, TextInput, TextInputProps } from 'react-native';

export function Input(props: TextInputProps): React.JSX.Element {
  return <TextInput placeholderTextColor="#777" style={styles.input} {...props} />;
}

const styles = StyleSheet.create({
  input: {
    borderWidth: 1,
    borderColor: '#DDD',
    borderRadius: 10,
    paddingHorizontal: 12,
    paddingVertical: 10,
  },
});
