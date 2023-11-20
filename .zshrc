# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fasd)
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=03'
bindkey '`' autosuggest-accept
# zstyle ':completion:*'  list-colors '=*=90'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export https_proxy=http://127.0.0.1:7890;
export http_proxy=http://127.0.0.1:7890;
# export all_proxy=socks5://127.0.0.1:7891

xhost local:root > ~/.out

# source ~/Learn/catkin_ws/devel/setup.zsh
# source ~/Explore_plan/tare_planner/devel/setup.zsh
# source ~/Explore_plan/autonomous_exploration_development_environment/devel/setup.zsh
# source /opt/ros/noetic/setup.zsh
# source ./devel/setup.zsh 2> ~/.out
# [[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
# alias python=/usr/bin/python3.8
function kros(){
  ps -ef | grep ros | grep -v grep | awk {'print"kill -9 " $2'} | sh
}
function k(){
  ps -ef | grep $1 | grep -v grep | awk {'print"kill -9 " $2'} | sh
}
function c(){
  conda activate $1
}
function d(){
  conda activate base
}
alias zotero="sh ~/Software/Zotero_linux-x86_64/zotero"
alias t="tmux"
alias clion="sh /home/cjh/Software/clion-2023.1.2/bin/clion.sh"
alias pycharm="sh /home/cjh/Software/pycharm-2023.1.2/bin/pycharm.sh"
alias no="source /opt/ros/noetic/setup.zsh"
alias ga="source /opt/ros/galactic/setup.zsh"
alias fo="source /opt/ros/foxy/setup.zsh"
alias r="ROS_DOMAIN_ID="
alias p="cat ~/.pwd"
alias gz="gedit ~/.zshrc"
alias sz="source ~/.zshrc"
alias si="source install/setup.zsh"
alias xo="xdg-open"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH=$PATH:/usr/local/cuda/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cjh/Software/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cjh/Software/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/cjh/Software/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/cjh/Software/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# export PYTHONPATH=$PYTHONPATH:/home/cjh/Learn/pyTest
# export PYTHONPATH=$PYTHONPATH:/home/cjh/Explore_plan/diffuser
# export PYTHONPATH=$PYTHONPATH:/home/cjh/Explore_plan/test_rl
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/cjh/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export UE4_ROOT=~/Software/UnrealEngine_4.26
export PYTHONPATH=$PYTHONPATH:/home/cjh/Explore_plan/habitat/habitat-sim

# need by op_bridge
# export CARLA_ROOT=/home/cjh/Project/CARLA_0.9.13
# export CARLA_ROOT=/home/cjh/Project/CARLA_0.9.13-dirty
export CARLA_ROOT=/home/cjh/Project/CARLA_0.9.13-2023.11.17
# export CARLA_ROOT=/home/cjh/Software/carla
# export CARLA_ROOT=/home/cjh/Project/CARLA_0.9.14
# export CARLA_ROOT=/home/cjh/Project/carla
export SCENARIO_RUNNER_ROOT=/home/cjh/Project/carla-autoware-stable/scenario_runner
export LEADERBOARD_ROOT=/home/cjh/Project/carla-autoware-stable/op_bridge
export TEAM_CODE_ROOT=/home/cjh/Project/carla-autoware-stable/op_agent
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/util
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/agents
# export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.13-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.13-py3.8-linux-x86_64.egg
# to export python into python workspace
export PYTHONPATH=${PYTHONPATH}:${SCENARIO_RUNNER_ROOT}:${LEADERBOARD_ROOT}
# use fast DDS instead of cyclone DDS to avoid broadcasting to all LAN
source /opt/ros/galactic/setup.zsh
export RCUTILS_COLORIZED_OUTPUT=1
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
# setup seperate ros domain for running carla-autoware
export ROS_DOMAIN_ID=5

# setup workspace for carla_autoware
export CARLA_AUTOWARE_ROOT=/home/cjh/Project/carla-autoware-stable
export CARLA_AUTOWARE_DOCKER_ROOT=/home/cjh/Project/carla-autoware-docker
# source /home/cjh/Software/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LIBGL_ALWAYS_SOFTWARE=1
export APOLLO_ROOT_DIR=/home/cjh/Project/apollo
export CYCLONEDDS_URI=/home/cjh/Project/autoware/cyclonedds.xml
export SUMO_HOME=/usr/share/sumo

alias carla="/home/cjh/Project/CARLA_0.9.13-2023.11.17/CarlaUE4.sh"
alias ego="cd /home/cjh/Project/carla-ros-bridge && source install/setup.zsh && ros2 launch carla_ros_bridge carla_ros_bridge_with_example_ego_vehicle.launch.py"
alias autoware="cd /home/cjh/Project/autoware && source install/setup.zsh && ros2 launch autoware_launch autoware_carla.launch.xml vehicle_model:=sample_vehicle sensor_model:=carla_sensor_kit map_path:=/home/cjh/Project/map/custom_junctions_with_boundary"
alias aa="cd /home/cjh/Project/apollo-modules-ros2 && source install/setup.zsh && ros2 launch apollo_autoware_bridge aa_bridge_launch.xml"
alias rr="ros2 daemon stop && ros2 daemon start"

alias m="python3 /home/cjh/Project/carla_test/main.py"

# check if fasd is installed
if (( ! ${+commands[fasd]} )); then
  return
fi

fasd_cache="${ZSH_CACHE_DIR}/fasd-init-cache"
if [[ "$commands[fasd]" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install \
    zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

alias v='f -e "$EDITOR"'
alias o='a -e xdg-open'
alias j='zz'

# Add TeX Live to the PATH, MANPATH, INFOPATH
export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH

source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
