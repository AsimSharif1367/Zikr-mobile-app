import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Screen } from '@/components/common/Screen';
import { Button } from '@/components/common/Button';

export function LoginScreen(): React.JSX.Element {
  return (
    <Screen>
      <View style={styles.container}>
        <Text style={styles.heading}>Optional Login</Text>
        <Button title="Continue with Email" onPress={() => undefined} />
        <Button title="Continue with Google" onPress={() => undefined} />
        <Button title="Continue with Apple" onPress={() => undefined} />
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
