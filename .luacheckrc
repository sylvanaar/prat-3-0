std = "lua51"
max_line_length = false
exclude_files = {
	"**/libraries/**/*.lua",
	".luacheckrc",
}
ignore = {
	"11./SLASH_.*", -- Setting an undefined (Slash handler) global variable
	"11./BINDING_.*", -- Setting an undefined (Keybinding header) global variable
}
globals = {
  "Prat",
}
