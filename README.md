# Testing git `bare` repositories

Everything you will find in this repository comes from my local machine's home folder. I need to be able to store everything in one place, while also being able to easily clone everything and getting it ready for a new installation. Also, sensible information must be private.

## Inspiration
The general instructions to do this are in [this article](https://www.atlassian.com/git/tutorials/dotfiles). Of course, I changed paths and things that apply to my machine. The long-term goal is to be able to use these files for my main machine and for the laptop (running MacOS, and probably requires a separate branch).

## Procedure
If you want to implement this, follow these steps

### 1. Start a `bare` git repository
This is a step you execute in your machine. From the home folder

``` sh
mkdir .config/dots
cd .config/dots
git init --bare
```

Next, add this to your shell's rc

``` sh
alias dots='/usr/bin/git --git-dir $HOME/.config/dots/ --work-tree=$HOME'
```

The next step is critical, because it allows you to work with several untracked files without filling your terminal. 

``` sh
exec zsh
dots config --local status.showUntrackedFiles no
```

### 2. Setting up a `GitHub` repository
In order to set this up, I have to create an empty github repository following the standard procedure. Then,

``` sh
dots remote add dots git@github.com:nitnelav27/dots.git
```

### 3. Adding files
As an example, if I want to add my `alacritty` config file, localted in `~/.config/alacritty`

``` sh
dots add ~/.config/alacritty
dots commit -a -m "Adding alacritty config"
dots push dots master
```
