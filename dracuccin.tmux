#!/usr/bin/env bash

# Set path of script
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# import
source "${PLUGIN_DIR}/builder/module_builder.sh"
source "${PLUGIN_DIR}/builder/window_builder.sh"
source "${PLUGIN_DIR}/builder/pane_builder.sh"
source "${PLUGIN_DIR}/utils/tmux_utils.sh"
source "${PLUGIN_DIR}/utils/module_utils.sh"


main() {
<<<<<<< HEAD:catppuccin.tmux
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  local theme
  theme="$(get_tmux_option "@catppuccin_flavour" "mocha")"

=======
  local theme
  theme="$(get_tmux_option "@dracuccin_flavour" "dracula")"

>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux
  # Aggregate all commands in one array
  local tmux_commands=()

  # module directories
  local custom_path="$(get_tmux_option "@catppuccin_custom_plugin_dir" "${PLUGIN_DIR}/custom")"
  local modules_custom_path=$custom_path
  local modules_status_path=$PLUGIN_DIR/status
  local modules_window_path=$PLUGIN_DIR/window
  local modules_pane_path=$PLUGIN_DIR/pane

  # load local theme
  local theme="$(get_tmux_option "@catppuccin_flavour" "mocha")"
  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
<<<<<<< HEAD:catppuccin.tmux
  # shellcheck source=catppuccin-frappe.tmuxtheme
  # https://github.com/dylanaraps/pure-sh-bible#parsing-a-keyval-file
  while IFS='=' read -r key val; do
      # Skip over lines containing comments.
      # (Lines starting with '#').
      [ "${key##\#*}" ] || continue

      # '$key' stores the key.
      # '$val' stores the value.
      eval "local $key"="$val"
  done < "${PLUGIN_DIR}/catppuccin-${theme}.tmuxtheme"

  # status general
  local status_default=$(get_tmux_option "@catppuccin_status_default" "on")
  set status "$status_default"

  local status_justify=$(get_tmux_option "@catppuccin_status_justify" "left")
  set status-justify "$status_justify"

  local status_background=$(get_tmux_option "@catppuccin_status_background" "theme")
  if [ "${status_background}" = "theme" ];
  then
    set status-bg "${thm_bg}"
  else
    if [ "${status_background}" = "default" ]
    then
      set status-style bg=default
    else
      set status-bg "${status_background}"
    fi
  fi
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  # shellcheck source=catppuccin-frappe.tmuxtheme
  source /dev/stdin <<<"$(sed -e "/^[^#].*=/s/^/local /" "${PLUGIN_DIR}/catppuccin-${theme}.tmuxtheme")"
=======
  # shellcheck source=dracuccin-frappe.tmuxtheme
  source /dev/stdin <<<"$(sed -e "/^[^#].*=/s/^/local /" "${PLUGIN_DIR}/dracuccin-${theme}.tmuxtheme")"
>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux

  set status-left-length "100"
  set status-right-length "100"


  # messages
  set message-style "fg=${thm_cyan},bg=${thm_gray},align=centre"
  set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

  # panes
  local pane_status_enable=$(get_tmux_option "@catppuccin_pane_status_enabled" "no") # yes
  local pane_border_status=$(get_tmux_option "@catppuccin_pane_border_status" "off") # bottom
  local pane_border_style=$(get_tmux_option "@catppuccin_pane_border_style" "fg=${thm_gray}")
  local pane_active_border_style=$(\
    get_tmux_option "@catppuccin_pane_active_border_style" \
    "#{?pane_in_mode,fg=${thm_yellow},#{?pane_synchronized,fg=${thm_magenta},fg=${thm_orange}}}"
  )
  local pane_left_separator=$(get_tmux_option "@catppuccin_pane_left_separator" "█")
  local pane_middle_separator=$(get_tmux_option "@catppuccin_pane_middle_separator" "█")
  local pane_right_separator=$(get_tmux_option "@catppuccin_pane_right_separator" "█")
  local pane_number_position=$(get_tmux_option "@catppuccin_pane_number_position" "left") # right, left
  local pane_format=$(load_modules "pane_default_format" "$modules_custom_path" "$modules_pane_path")

  setw pane-border-status "$pane_border_status"
  setw pane-active-border-style "$pane_active_border_style"
  setw pane-border-style "$pane_border_style"
  setw pane-border-format "$pane_format"

  # window
  local window_status_separator=$(get_tmux_option "@catppuccin_window_separator" "")
  setw window-status-separator "$window_status_separator"

  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  local window_left_separator=$(get_tmux_option "@catppuccin_window_left_separator" "█")
  local window_right_separator=$(get_tmux_option "@catppuccin_window_right_separator" "█")
  local window_middle_separator=$(get_tmux_option "@catppuccin_window_middle_separator" "█ ")
  local window_number_position=$(get_tmux_option "@catppuccin_window_number_position" "left") # right, left
  local window_status_enable=$(get_tmux_option "@catppuccin_window_status_enable" "no") # right, left

<<<<<<< HEAD:catppuccin.tmux
  local window_format=$(load_modules "window_default_format" "$modules_custom_path" "$modules_window_path")
  setw window-status-format "$window_format"
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  # NOTE: Checking for the value of @catppuccin_window_tabs_enabled
  local wt_enabled
  wt_enabled="$(get_tmux_option "@catppuccin_window_tabs_enabled" "off")"
  readonly wt_enabled
 
  local pill_theme_enabled
  pill_theme_enabled="$(get_tmux_option "@catppuccin_pill_theme_enabled" "off")"
  readonly pill_theme_enabled
  
  local powerline_theme_enabled
  powerline_theme_enabled="$(get_tmux_option "@catppuccin_powerline_theme_enabled" "off")"
  readonly powerline_theme_enabled
=======
  # NOTE: Checking for the value of @dracuccin_window_tabs_enabled
  local wt_enabled
  wt_enabled="$(get_tmux_option "@dracuccin_window_tabs_enabled" "off")"
  readonly wt_enabled

  local pill_theme_enabled
  pill_theme_enabled="$(get_tmux_option "@dracuccin_pill_theme_enabled" "off")"
  readonly pill_theme_enabled

  local powerline_theme_enabled
  powerline_theme_enabled="$(get_tmux_option "@dracuccin_powerline_theme_enabled" "off")"
  readonly powerline_theme_enabled
>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux

<<<<<<< HEAD:catppuccin.tmux
  local window_current_format=$(load_modules "window_current_format" "$modules_custom_path" "$modules_window_path")
  setw window-status-current-format "$window_current_format"
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  local powerline_icons_theme_enabled
  powerline_icons_theme_enabled="$(get_tmux_option "@catppuccin_powerline_icons_theme_enabled" "off")"
  readonly powerline_icons_theme_enabled
=======
  local powerline_icons_theme_enabled
  powerline_icons_theme_enabled="$(get_tmux_option "@dracuccin_powerline_icons_theme_enabled" "off")"
  readonly powerline_icons_theme_enabled
>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux

<<<<<<< HEAD:catppuccin.tmux
  # status module
  local status_left_separator=$(get_tmux_option "@catppuccin_status_left_separator" "")
  local status_right_separator=$(get_tmux_option "@catppuccin_status_right_separator" "█")
  local status_right_separator_inverse=$(get_tmux_option "@catppuccin_status_right_separator_inverse" "no")
  local status_connect_separator=$(get_tmux_option "@catppuccin_status_connect_separator" "yes")
  local status_fill=$(get_tmux_option "@catppuccin_status_fill" "icon")
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  local no_patched_fonts_theme_enabled
  no_patched_fonts_theme_enabled="$(get_tmux_option "@catppuccin_no_patched_fonts_theme_enabled" "off")"
  readonly no_patched_fonts_theme_enabled
  
  # Separators for the left status / window list 
  local l_left_separator
  l_left_separator="$(get_tmux_option "@catppuccin_l_left_separator" "")"
  readonly l_left_separator
=======
  local no_patched_fonts_theme_enabled
  no_patched_fonts_theme_enabled="$(get_tmux_option "@dracuccin_no_patched_fonts_theme_enabled" "off")"
  readonly no_patched_fonts_theme_enabled

  # Separators for the left status / window list
  local l_left_separator
  l_left_separator="$(get_tmux_option "@dracuccin_l_left_separator" "")"
  readonly l_left_separator
>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux

<<<<<<< HEAD:catppuccin.tmux
  local status_modules_left=$(get_tmux_option "@catppuccin_status_modules_left" "")
  local loaded_modules_left=$(load_modules "$status_modules_left" "$modules_custom_path" "$modules_status_path")
  set status-left "$loaded_modules_left"
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  local l_right_separator
  l_right_separator="$(get_tmux_option "@catppuccin_l_right_separator" "")"
  readonly l_right_separator
=======
  local l_right_separator
  l_right_separator="$(get_tmux_option "@dracuccin_l_right_separator" "")"
  readonly l_right_separator
>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux

<<<<<<< HEAD:catppuccin.tmux
  local status_modules_right=$(get_tmux_option "@catppuccin_status_modules_right" "application session")
  local loaded_modules_right=$(load_modules "$status_modules_right" "$modules_custom_path" "$modules_status_path")
  set status-right "$loaded_modules_right"
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  # Separators for the right status 
  local r_left_separator
  r_left_separator="$(get_tmux_option "@catppuccin_r_left_separator" "")"
  readonly r_left_separator
=======
  # Separators for the right status
  local r_left_separator
  r_left_separator="$(get_tmux_option "@dracuccin_r_left_separator" "")"
  readonly r_left_separator
>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux

<<<<<<< HEAD:catppuccin.tmux
  # modes
||||||| parent of 06ac771 (Innitial changes):catppuccin.tmux
  local r_right_separator
  r_right_separator="$(get_tmux_option "@catppuccin_r_right_separator" "")"
  readonly r_right_separator
  
  local user
  user="$(get_tmux_option "@catppuccin_user" "off")"
  readonly user

  local host
  host="$(get_tmux_option "@catppuccin_host" "off")"
  readonly host

  local date_time
  date_time="$(get_tmux_option "@catppuccin_date_time" "off")"
  readonly date_time
 
  # Icons
  local directory_icon
  directory_icon="$(get_tmux_option "@catppuccin_directory_icon" "")"
  readonly directory_icon

  local window_icon
  window_icon="$(get_tmux_option "@catppuccin_window_icon" "")"
  readonly window_icon

  local session_icon
  session_icon="$(get_tmux_option "@catppuccin_session_icon" "")"
  readonly session_icon

  local user_icon
  user_icon="$(get_tmux_option "@catppuccin_user_icon" "")"
  readonly user_icon

  local host_icon
  host_icon="$(get_tmux_option "@catppuccin_host_icon" "󰒋")"
  readonly host_icon

  local datetime_icon
  datetime_icon="$(get_tmux_option "@catppuccin_datetime_icon" "")"
  readonly datetime_icon

  # Source status line themes
  if [[ "${pill_theme_enabled}" == "off" ]] &&
    [[ "${powerline_theme_enabled}"  == "off" ]] && 
    [[ "${powerline_icons_theme_enabled}" == "off" ]] &&
    [[ "${no_patched_fonts_theme_enabled}" == "off" ]]; then
    source "$PLUGIN_DIR/$DEFAULT_STATUS_LINE_FILE"
  fi

  if [[ "${pill_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$PILL_STATUS_LINE_FILE"
  fi

  if [[ "${powerline_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$POWERLINE_STATUS_LINE_FILE"
  fi

  if [[ "${powerline_icons_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$POWERLINE_ICONS_STATUS_LINE_FILE"
  fi

  if [[ "${no_patched_fonts_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$NO_PATCHED_FONTS_STATUS_LINE_FILE"
  fi

  # Right column 1 by default shows the Window name.
  local right_column1=$show_window

  # Right column 2 by default shows the current Session name.
  local right_column2=$show_session

  # Window status by default shows the current directory basename.
  local window_status_format=$show_directory_in_window_status
  local window_status_current_format=$show_directory_in_window_status_current

  # NOTE: With the @catppuccin_window_tabs_enabled set to on, we're going to
  # update the right_column1 and the window_status_* variables.
  if [[ "${wt_enabled}" == "on" ]]; then
    right_column1=$show_directory
    window_status_format=$show_window_in_window_status
    window_status_current_format=$show_window_in_window_status_current
  fi

  if [[ "${user}" == "on" ]]; then
    right_column2="$right_column2$show_user"
  fi

  if [[ "${host}" == "on" ]]; then
    right_column2="$right_column2$show_host"
  fi

  if [[ "${date_time}" != "off" ]]; then
    right_column2="$right_column2$show_date_time"
  fi

  set status-left ""
  set status-right "${right_column1}${right_column2}"

  setw window-status-format "${window_status_format}"
  setw window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
=======
  local r_right_separator
  r_right_separator="$(get_tmux_option "@dracuccin_r_right_separator" "")"
  readonly r_right_separator

  local user
  user="$(get_tmux_option "@dracuccin_user" "off")"
  readonly user

  local host
  host="$(get_tmux_option "@dracuccin_host" "off")"
  readonly host

  local date_time
  date_time="$(get_tmux_option "@dracuccin_date_time" "off")"
  readonly date_time

  # Icons
  local directory_icon
  directory_icon="$(get_tmux_option "@dracuccin_directory_icon" "")"
  readonly directory_icon

  local window_icon
  window_icon="$(get_tmux_option "@dracuccin_window_icon" "")"
  readonly window_icon

  local session_icon
  session_icon="$(get_tmux_option "@dracuccin_session_icon" "")"
  readonly session_icon

  local user_icon
  user_icon="$(get_tmux_option "@dracuccin_user_icon" "")"
  readonly user_icon

  local host_icon
  host_icon="$(get_tmux_option "@dracuccin_host_icon" "󰒋")"
  readonly host_icon

  local datetime_icon
  datetime_icon="$(get_tmux_option "@dracuccin_datetime_icon" "")"
  readonly datetime_icon

  # Source status line themes
  if [[ "${pill_theme_enabled}" == "off" ]] &&
    [[ "${powerline_theme_enabled}"  == "off" ]] &&
    [[ "${powerline_icons_theme_enabled}" == "off" ]] &&
    [[ "${no_patched_fonts_theme_enabled}" == "off" ]]; then
    source "$PLUGIN_DIR/$DEFAULT_STATUS_LINE_FILE"
  fi

  if [[ "${pill_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$PILL_STATUS_LINE_FILE"
  fi

  if [[ "${powerline_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$POWERLINE_STATUS_LINE_FILE"
  fi

  if [[ "${powerline_icons_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$POWERLINE_ICONS_STATUS_LINE_FILE"
  fi

  if [[ "${no_patched_fonts_theme_enabled}" == "on" ]]; then
    source "$PLUGIN_DIR/$NO_PATCHED_FONTS_STATUS_LINE_FILE"
  fi

  # Right column 1 by default shows the Window name.
  local right_column1=$show_window

  # Right column 2 by default shows the current Session name.
  # local right_column2=$show_session

  local left_column2=$show_session_left

  # Window status by default shows the current directory basename.
  local window_status_format=$show_directory_in_window_status
  local window_status_current_format=$show_directory_in_window_status_current

  # NOTE: With the @dracuccin_window_tabs_enabled set to on, we're going to
  # update the right_column1 and the window_status_* variables.
  if [[ "${wt_enabled}" == "on" ]]; then
    right_column1=$show_directory
    window_status_format=$show_window_in_window_status
    window_status_current_format=$show_window_in_window_status_current
  fi

  if [[ "${user}" == "on" ]]; then
    right_column2="$right_column2$show_user"
  fi

  if [[ "${host}" == "on" ]]; then
    right_column2="$right_column2$show_host"
  fi

  if [[ "${date_time}" != "off" ]]; then
    right_column2="$right_column2$show_date_time"
  fi

  set status-left "${left_column1}${left_column2}"
  set status-right "${right_column1}${right_column2}"

  setw window-status-format "${window_status_format}"
  setw window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
<<<<<<< HEAD
>>>>>>> 06ac771 (Innitial changes):dracuccin.tmux
  setw clock-mode-colour "${thm_blue}"
||||||| parent of 0a99301 (Update powerline colors)
  setw clock-mode-colour "${thm_blue}"
=======
  setw clock-mode-colour "${thm_yellow}"
>>>>>>> 0a99301 (Update powerline colors)
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"

  tmux "${tmux_commands[@]}"
}

main "$@"
