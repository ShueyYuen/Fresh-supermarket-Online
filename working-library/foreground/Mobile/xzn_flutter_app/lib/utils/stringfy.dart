String stringfy(Map a) {
  return a.toString().replaceAll("{", "{\"").replaceAll("}", "\"}").replaceAll(", ", "\",\"").replaceAll(": ", "\":\"");
}