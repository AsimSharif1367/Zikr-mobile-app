import React from 'react';
import { Text } from 'react-native';
import { NativeStackScreenProps } from '@react-navigation/native-stack';
import { Screen } from '@/components/common/Screen';
import { RootStackParamList } from '@/navigation/types';
import { useAppSelector } from '@/hooks/useAppSelector';
import { TasbeehCounter } from '../components/TasbeehCounter';

type Props = NativeStackScreenProps<RootStackParamList, 'Counter'>;

export function CounterScreen({ route }: Props): React.JSX.Element {
  const zikrId = route.params?.zikrId;
  const zikr = useAppSelector((state) => state.zikr.items.find((item) => item.id === zikrId));

  if (zikrId && !zikr) {
    return (
      <Screen>
        <Text>Unable to load zikr for counter.</Text>
      </Screen>
    );
  }

  return (
    <Screen>
      <TasbeehCounter target={zikr?.targetCount ?? 33} />
    </Screen>
  );
}
