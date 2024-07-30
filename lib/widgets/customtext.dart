String customText(String text, {int maxLength = 4}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}
