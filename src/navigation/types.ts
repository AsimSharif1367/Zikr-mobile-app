export type RootStackParamList = {
  MainTabs: undefined;
  ZikrDetail: { zikrId: string };
  CreateZikr: undefined;
  Counter: { zikrId?: string } | undefined;
};

export type MainTabParamList = {
  Zikr: undefined;
  Reminders: undefined;
  Analytics: undefined;
  Settings: undefined;
};
