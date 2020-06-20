String stringfy(Map a) {
  return a.toString().replaceAll("{", "{\"").replaceAll("}", "\"}").replaceAll(", ", "\",\"").replaceAll(": ", "\":\"");
}

String stringfy_list(List a) {
  return a.toString().replaceAll("[", "[\"").replaceAll("]", "\"]").replaceAll(", ", "\",\"");
}