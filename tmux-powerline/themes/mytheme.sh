# Default Theme

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="⮂"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="⮃"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="⮀"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="⮁"
else
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'235'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'255'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# via: http://yonchu.hatenablog.com/entry/2013/05/05/171925
# Format: segment_name background_color foreground_color [non_default_separator]

vim_cwd=$(tmux showenv $(tmux display -p 'TMUX_VIM_CWD_#D' | tr -d '%') 2> /dev/null)
vim_cwd=${vim_cwd#*=}

if [ -n "$vim_cwd" ]; then
	# vim 起動時のステータスライン設定

	if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
		TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info 148 234" \
			"hostname 63 255" \
			"vcs_branch 29 88" \
			"vcs_compare 60 255" \
			"vcs_staged 64 255" \
			"vcs_modified 9 255" \
			"vcs_others 245 0" \
			)
	fi

	if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
		TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		"pwd 89 211" \
			#"vim-cwd 21 231" \
			"date_day 235 136" \
			"date 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
			"time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
			)
	fi
else
	# vim未起動時のステータスライン設定
	# 以下は tmux-powerline デフォルトのテーマです。

	if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
		TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_session_info 148 234" \
			"hostname 33 0" \
			#"ifstat 30 255" \
			#"ifstat_sys 30 255" \
			"lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
			"wan_ip 24 255" \
			"vcs_branch 29 88" \
			"vcs_compare 60 255" \
			"vcs_staged 64 255" \
			"vcs_modified 9 255" \
			"vcs_others 245 0" \
			)
	fi

	if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
		TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		#"earthquake 3 0" \
			"pwd 89 211" \
			"mailcount 9 255" \
			"now_playing 234 37" \
			#"cpu 240 136" \
			"load 237 167" \
			#"tmux_mem_cpu_load 234 136" \
			"battery 137 127" \
			"weather 37 255" \
			#"rainbarf 0 0" \
			#"xkb_layout 125 117" \
			"date_day 235 136" \
			"date 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
			"time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
			#"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
			)
	fi
fi
