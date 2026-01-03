package auth0.naming

deny[msg] {
  not re_match("^[a-z0-9-]+$", input.display_name)
  msg = "Name must be lowercase alphanumerics and hyphens"
}
