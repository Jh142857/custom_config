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
COMPLETION_WAITING_DOTS="true"

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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=03'
# bindkey '`' autosuggest-accept
# zstyle ':completion:*'  list-colors '=*=90'

source $ZSH/oh-my-zsh.sh
# source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Software/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Software/anaconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/Software/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/Software/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# conda
function c(){
  conda activate $1
}
function d(){
  conda activate base
}

# Clash && VPN
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
# export all_proxy=socks5://127.0.0.1:7891
alias clash="cd ~/Software/clash && ./clash-linux-amd64-v1.10.0 -f glados.yaml -d ."

# cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# ROS
source /opt/ros/galactic/setup.zsh
export RCUTILS_COLORIZED_OUTPUT=1
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
# export LIBGL_ALWAYS_SOFTWARE=1 # rviz2
export CYCLONEDDS_URI=$HOME/.config/cyclonedds.xml
export ROS_DOMAIN_ID=5
alias rr="ros2 daemon stop && ros2 daemon start"
alias no="source /opt/ros/noetic/setup.zsh"
alias ga="source /opt/ros/galactic/setup.zsh"
alias fo="source /opt/ros/foxy/setup.zsh"
function kros(){
  ps -ef | grep ros | grep -v grep | awk {'print"kill -9 " $2'} | sh
}


# software 
alias zotero="sh ~/Software/Zotero_linux-x86_64/zotero"
alias t="tmux"
alias clion="sh $HOME/Software/clion-2023.1.2/bin/clion.sh"
alias pycharm="sh $HOME/Software/pycharm-2023.1.2/bin/pycharm.sh"
alias p="cat ~/.pwd"
alias xo="xdg-open"
function k(){
  ps -ef | grep $1 | grep -v grep | awk {'print"kill -9 " $2'} | sh
}

# carla
export UE4_ROOT=~/Software/UnrealEngine_4.26  # source code
export CARLA_ROOT=$HOME/Project/CARLA_0.9.13-2023.12.27
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.13-py3.8-linux-x86_64.egg
alias carla="$HOME/Project/CARLA_0.9.13-2023.12.27/CarlaUE4.sh"

# op_bridge(deprecated)
#export SCENARIO_RUNNER_ROOT=$HOME/Project/carla-autoware-stable/scenario_runner
#export LEADERBOARD_ROOT=$HOME/Project/carla-autoware-stable/op_bridge
#export TEAM_CODE_ROOT=$HOME/Project/carla-autoware-stable/op_agent
#export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
#export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/util
#export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
#export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/agents
## to export python into python workspace
#export PYTHONPATH=${PYTHONPATH}:${SCENARIO_RUNNER_ROOT}:${LEADERBOARD_ROOT}
## setup workspace for carla_autoware
#export CARLA_AUTOWARE_ROOT=$HOME/Project/carla-autoware-stable
#export CARLA_AUTOWARE_DOCKER_ROOT=$HOME/Project/carla-autoware-docker

# carla-ros-bridge
alias ego="cd $HOME/Project/carla-ros-bridge && source install/setup.zsh && ros2 launch carla_ros_bridge carla_ros_bridge_with_example_ego_vehicle.launch.py"

# autoware
alias autoware="cd $HOME/Project/autoware && source install/setup.zsh && ros2 launch autoware_launch autoware_carla.launch.xml vehicle_model:=igv_vehicle sensor_model:=carla_sensor_kit map_path:=$HOME/Project/map/simple_map_custom_junctions" # custom_junctions_with_boundary"

# apollo
export APOLLO_ROOT_DIR=$HOME/Project/apollo
alias aa="cd $HOME/Project/apollo-modules-ros2 && source install/setup.zsh && ros2 launch apollo_autoware_bridge aa_bridge_launch.xml"

# sumo
export SUMO_HOME=/usr/share/sumo
alias co="cd $HOME/Project/autoware && source install/setup.zsh && ros2 launch sumo_autoware_bridge co-simulation.launch.xml"
function lane_change(){
    cd $HOME/Project/autoware && source install/setup.zsh && ros2 launch sumo_autoware_bridge sumo_ros_bridge.launch.xml scenario:=lane_change example_num:=$1 departure_interval:=30
}
function crossroad(){
    cd $HOME/Project/autoware && source install/setup.zsh && ros2 launch sumo_autoware_bridge sumo_ros_bridge.launch.xml scenario:=crossroad example_num:=$1 departure_interval:=10 flow_num:=0
}

# docker
function docker_re() {
docker start $1 && docker attach $1
}

# Tex
export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH

# ros2 autocomplete
#source /usr/share/colcon_cd/function/colcon_cd.sh
#export _colcon_cd_root=/opt/ros/galactic/
#source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
# autocomplete after source
alias si="source install/setup.zsh && complete -o nospace -o default -F _python_argcomplete ros2 && complete -o nospace -o default -F _python_argcomplete colcon"

# zsh
alias gz="gedit ~/.zshrc"
alias sz="source ~/.zshrc"
alias zsh_reload="exec zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
