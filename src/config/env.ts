export const ENV = {
  appEnv: process.env.EXPO_PUBLIC_APP_ENV ?? 'development',
  analyticsEnabled: process.env.EXPO_PUBLIC_ENABLE_ANALYTICS === 'true',
};
