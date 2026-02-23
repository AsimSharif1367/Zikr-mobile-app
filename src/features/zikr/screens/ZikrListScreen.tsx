import React from 'react';
import { FlatList, View } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { Screen } from '@/components/common/Screen';
import { Button } from '@/components/common/Button';
import { EmptyState } from '@/components/common/EmptyState';
import { ZikrCard } from '../components/ZikrCard';
import { useAppSelector } from '@/hooks/useAppSelector';
import { RootStackParamList } from '@/navigation/types';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';

type Navigation = NativeStackNavigationProp<RootStackParamList>;

export function ZikrListScreen(): React.JSX.Element {
  const navigation = useNavigation<Navigation>();
  const zikrItems = useAppSelector((state) => state.zikr.items);

  return (
    <Screen>
      <View style={{ marginBottom: 12 }}>
        <Button title="Create Custom Zikr" onPress={() => navigation.navigate('CreateZikr')} />
      </View>
      {zikrItems.length === 0 ? (
        <EmptyState title="No zikr yet" subtitle="Create your first custom zikr reminder." />
      ) : (
        <FlatList
          data={zikrItems}
          keyExtractor={(item) => item.id}
          renderItem={({ item }) => (
            <ZikrCard item={item} onPress={() => navigation.navigate('ZikrDetail', { zikrId: item.id })} />
          )}
        />
      )}
    </Screen>
  );
}
