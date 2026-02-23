import React, { useState } from 'react';
import { StyleSheet, View } from 'react-native';
import { NativeStackScreenProps } from '@react-navigation/native-stack';
import { RootStackParamList } from '@/navigation/types';
import { Screen } from '@/components/common/Screen';
import { Input } from '@/components/common/Input';
import { Button } from '@/components/common/Button';
import { useAppDispatch } from '@/hooks/useAppDispatch';
import { addZikr } from '@/store/slices/zikrSlice';

type Props = NativeStackScreenProps<RootStackParamList, 'CreateZikr'>;

export function CreateZikrScreen({ navigation }: Props): React.JSX.Element {
  const dispatch = useAppDispatch();
  const [name, setName] = useState('');
  const [arabicText, setArabicText] = useState('');
  const [translation, setTranslation] = useState('');
  const [targetCount, setTargetCount] = useState('33');

  const onSave = () => {
    if (!name.trim()) {
      return;
    }

    dispatch(
      addZikr({
        name: name.trim(),
        arabicText: arabicText.trim(),
        translation: translation.trim(),
        targetCount: Number(targetCount) || 33,
        isReminderEnabled: true,
      }),
    );

    navigation.goBack();
  };

  return (
    <Screen>
      <View style={styles.form}>
        <Input placeholder="Zikr name (e.g., Astaghfirullah)" value={name} onChangeText={setName} />
        <Input placeholder="Arabic text" value={arabicText} onChangeText={setArabicText} />
        <Input placeholder="Translation" value={translation} onChangeText={setTranslation} />
        <Input
          placeholder="Target count"
          value={targetCount}
          onChangeText={setTargetCount}
          keyboardType="numeric"
        />
        <Button title="Save Zikr" onPress={onSave} />
      </View>
    </Screen>
  );
}

const styles = StyleSheet.create({
  form: {
    gap: 12,
  },
});
