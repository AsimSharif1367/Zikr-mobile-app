import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { NativeStackScreenProps } from '@react-navigation/native-stack';
import { RootStackParamList } from '@/navigation/types';
import { Screen } from '@/components/common/Screen';
import { Button } from '@/components/common/Button';
import { useAppSelector } from '@/hooks/useAppSelector';

type Props = NativeStackScreenProps<RootStackParamList, 'ZikrDetail'>;

export function ZikrDetailScreen({ route, navigation }: Props): React.JSX.Element {
  const zikrItem = useAppSelector((state) =>
    state.zikr.items.find((item) => item.id === route.params.zikrId),
  );

  if (!zikrItem) {
    return (
      <Screen>
        <Text>Zikr not found.</Text>
      </Screen>
    );
  }

  return (
    <Screen>
      <View style={styles.content}>
        <Text style={styles.title}>{zikrItem.name}</Text>
        {zikrItem.arabicText ? <Text style={styles.arabic}>{zikrItem.arabicText}</Text> : null}
        {zikrItem.translation ? <Text style={styles.translation}>{zikrItem.translation}</Text> : null}
        <Text style={styles.goal}>Target Count: {zikrItem.targetCount}</Text>
        <Button title="Open Counter" onPress={() => navigation.navigate('Counter', { zikrId: zikrItem.id })} />
      </View>
    </Screen>
  );
}

const styles = StyleSheet.create({
  content: {
    gap: 14,
  },
  title: {
    fontSize: 22,
    fontWeight: '700',
  },
  arabic: {
    fontSize: 24,
    textAlign: 'right',
  },
  translation: {
    color: '#6B7280',
  },
  goal: {
    fontWeight: '600',
  },
});
