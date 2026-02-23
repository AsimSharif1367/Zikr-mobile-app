import React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { MainTabParamList, RootStackParamList } from './types';
import { ZikrListScreen } from '@/features/zikr/screens/ZikrListScreen';
import { RemindersScreen } from '@/features/reminders/screens/RemindersScreen';
import { AnalyticsScreen } from '@/features/analytics/screens/AnalyticsScreen';
import { SettingsScreen } from '@/features/settings/screens/SettingsScreen';
import { ZikrDetailScreen } from '@/features/zikr/screens/ZikrDetailScreen';
import { CreateZikrScreen } from '@/features/zikr/screens/CreateZikrScreen';
import { CounterScreen } from '@/features/counter/screens/CounterScreen';

const Tab = createBottomTabNavigator<MainTabParamList>();
const Stack = createNativeStackNavigator<RootStackParamList>();

function MainTabs(): React.JSX.Element {
  return (
    <Tab.Navigator>
      <Tab.Screen name="Zikr" component={ZikrListScreen} />
      <Tab.Screen name="Reminders" component={RemindersScreen} />
      <Tab.Screen name="Analytics" component={AnalyticsScreen} />
      <Tab.Screen name="Settings" component={SettingsScreen} />
    </Tab.Navigator>
  );
}

export function RootNavigator(): React.JSX.Element {
  return (
    <Stack.Navigator>
      <Stack.Screen name="MainTabs" component={MainTabs} options={{ headerShown: false }} />
      <Stack.Screen name="ZikrDetail" component={ZikrDetailScreen} options={{ title: 'Zikr Details' }} />
      <Stack.Screen name="CreateZikr" component={CreateZikrScreen} options={{ title: 'Create Zikr' }} />
      <Stack.Screen name="Counter" component={CounterScreen} options={{ title: 'Tasbeeh Counter' }} />
    </Stack.Navigator>
  );
}
