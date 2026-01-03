package auth0.callbacks

deny[msg] {
  some i
  input.callbacks[i] == "https://example.com/*"
  msg = "Wildcard callbacks not allowed"
}

deny[msg] {
  some i
  startswith(input.callbacks[i], "http://")
  msg = "HTTP callbacks are not allowed; use HTTPS"
}
