package auth0.grants

deny[msg] {
  input.app_type == "regular_web"
  some i
  input.grant_types[i] == "implicit"
  msg = "implicit grant is not allowed for regular_web apps"
}
