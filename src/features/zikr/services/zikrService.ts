import { ZikrItem } from '@/types/domain';

export const zikrService = {
  async list(): Promise<ZikrItem[]> {
    return [];
  },
  async save(_item: ZikrItem): Promise<void> {
    return;
  },
};
