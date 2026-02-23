export const analyticsService = {
  getDailyCompletionRate(completed: number, missed: number): number {
    const total = completed + missed;
    if (total === 0) {
      return 0;
    }
    return Math.round((completed / total) * 100);
  },
};
