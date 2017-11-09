# Cmd aliases
alias rm="rm -i"
alias ll="ls -l"
alias la="ls -a"
alias l.="ls -d .*"

# Git aliases
alias gcom="git commit -m"
alias gri="git rebase -i"

function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
   set_color $fish_color_cwd
   printf '%s' (whoami)
   set_color normal
   printf ' @ '

   set_color yellow
   printf 'flavortown'
   set_color normal
   printf ' in '

   set_color magenta
   printf '%s' (prompt_pwd)
   set_color normal

   if [ (_git_branch_name) ]
      set_color normal
      printf ' on '
      set_color cyan
      printf '%s' (_git_branch_name)
      set_color normal
      printf ' is '

      if [ (_is_git_dirty) ]
         set_color yellow
         printf '汚い'
      else
         set_color green
         printf '浄'
      end
   set_color normal
   end

   # Line 2
   echo
   if test $VIRTUAL_ENV
       printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
   end
   printf '↪ '
   set_color normal
end
