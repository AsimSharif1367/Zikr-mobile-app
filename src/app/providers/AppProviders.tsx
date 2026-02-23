import React, { PropsWithChildren } from 'react';
import { Provider } from 'react-redux';
import { NavigationContainer } from '@react-navigation/native';
import { store } from '@/store';

export function AppProviders({ children }: PropsWithChildren): React.JSX.Element {
  return (
    <Provider store={store}>
      <NavigationContainer>{children}</NavigationContainer>
    </Provider>
  );
}
