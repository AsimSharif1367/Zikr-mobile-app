module.exports = {
  preset: 'jest-expo',
  testMatch: ['**/src/tests/**/*.test.ts', '**/src/tests/**/*.test.tsx'],
  collectCoverageFrom: ['src/**/*.{ts,tsx}', '!src/tests/**'],
};
