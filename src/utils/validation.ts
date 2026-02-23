export function isValidPositiveNumber(value: string): boolean {
  const numberValue = Number(value);
  return Number.isFinite(numberValue) && numberValue > 0;
}
