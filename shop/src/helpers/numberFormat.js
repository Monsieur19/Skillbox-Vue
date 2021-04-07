export default function numberFormat(value) {
  if (Number.isInteger(value)) {
    return Intl.NumberFormat().format(value);
  }
  return '';
}
