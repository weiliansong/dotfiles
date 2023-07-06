set -g default-terminal "screen-256color"

# fixes tmux and vim mouse issue
set -g mouse on

# copy mode to vi bindings
setw -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
bind-key -T copy-mode-vi 'r' send -X rectangle-toggle

# remap prefix from 'C-b' to 'Alt-a'
unbind C-b
set-option -g prefix M-e
bind-key M-e send-prefix

# Commands to reorder windows
bind-key -n C-S-Left swap-window -t -1
bind-key -n C-S-Right swap-window -t +1

# remove the annoying delay of esc key
set -s escape-time 0

# split panes using | and -, with PWD starting directory
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# New window has the same directory as the current one
bind c new-window -c "#{pane_current_path}"

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

# switch panes without prefix
bind -n M-y select-pane -L
bind -n M-o select-pane -R
bind -n M-i select-pane -U
bind -n M-u select-pane -D

# switch windows using Alt-j/k without prefix
bind -n M-j select-window -p
bind -n M-k select-window -n

# switch to last used window without prefix, and a different binding
bind -n M-w last-window

# don't rename windows automatically
set-option -g allow-rename off

# custom status
set -g status-right-length 70
set -g status-right 'Load #(uptime | rev | cut -d":" -f1 | rev | sed s/,//g | cut -d" " -f2) | #H | %h %d %l:%M %p '

# nord colorscheme setup
set -g @nord_tmux_no_patched_font "1"
set -g @nord_tmux_show_status_content "1"

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'arcticicestudio/nord-tmux'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"
run '~/.tmux/plugins/tpm/tpm'
