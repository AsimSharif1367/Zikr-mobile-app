import { useMemo, useState } from 'react';

export function useCounter(target: number = 33) {
  const [count, setCount] = useState(0);

  const increment = () => setCount((value) => value + 1);
  const reset = () => setCount(0);
  const isGoalReached = useMemo(() => count >= target, [count, target]);

  return {
    count,
    increment,
    reset,
    target,
    isGoalReached,
  };
}
