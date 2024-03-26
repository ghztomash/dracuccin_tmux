show_session() {
  local index=$1
  local icon=$(get_tmux_option "@dracuccin_session_icon" "")
  local color=$(get_tmux_option "@dracuccin_session_color" "#{?client_prefix,$thm_green,$thm_blue}")
  local text=$(get_tmux_option "@dracuccin_session_text" "#S")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
