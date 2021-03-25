# Testing git `bare` repositories

Everything you will find in this repository comes from my local machine's home folder. It consolidates everything from my rarely used `bashrc` to my everyday config files (like Emacs stuff). I need to be able to store everything in one place, while also being able to easily clone everything and getting it ready for a new installation. Also, sensible information must be private.

## Inspiration
The general instructions to do this are in [this article](https://www.atlassian.com/git/tutorials/dotfiles). Of course, I changed paths and things that apply to my machine. The long-term goal is to be able to use these files for my main machine and for the laptop (MacBook Pro 2018 touchbar).

## Procedure
If you want to implement this, follow these steps

### 1. Start a `bare` git repository
This is a step you execute in your machine.

``` sh
git init --bare $HOME/.dots
```

Next, add this to your shell's rc

``` sh
alias dots='/usr/bin/git --git-dir $HOME/.dots/ --work-tree=$HOME'
```

The next step is critical, because it allows you to work with several untracked files without filling your terminal. 

``` sh
dots config --local status/showUntrackedFiles no
```

### 2. Setting up a `GitHub` repository
In order to set this up, I have to create an empty github repository following the standard procedure. Then,

``` sh
dots remote add dots git@github.com:nitnelav27/dots.git
```

### 3. Adding files
As an example, if I want to add my `i3` config file, localted in `~/.config/i3`

``` sh
dots add ~/.config/i3/config
dots commit -a -m "Adding i3 config"
dots push dots master
```
