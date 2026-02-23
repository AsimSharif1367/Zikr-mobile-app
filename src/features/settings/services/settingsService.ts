export const settingsService = {
  validateQuietHours(start: string, end: string): boolean {
    return Boolean(start) && Boolean(end);
  },
};
