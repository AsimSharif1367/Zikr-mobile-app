import React, { PropsWithChildren } from 'react';
import { SafeAreaView, StyleSheet, ViewStyle } from 'react-native';

type ScreenProps = PropsWithChildren<{
  style?: ViewStyle;
}>;

export function Screen({ children, style }: ScreenProps): React.JSX.Element {
  return <SafeAreaView style={[styles.container, style]}>{children}</SafeAreaView>;
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 16,
    paddingVertical: 12,
  },
});
