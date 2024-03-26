show_window_current_format() {
  local number="#I"
  local color=$(get_tmux_option "@dracuccin_window_current_color" "$thm_pink")
  local background=$(get_tmux_option "@dracuccin_window_current_background" "$thm_bg")
  local text="$(get_tmux_option "@dracuccin_window_current_text" "#W")" # use #W for application instead of directory
  local fill="$(get_tmux_option "@dracuccin_window_current_fill" "number")" # number, all, none

  local current_window_format=$( build_window_format "$number" "$color" "$background" "$text" "$fill" )

  echo "$current_window_format"
}
