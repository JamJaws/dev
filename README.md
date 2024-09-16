# dev

My dev config files etc.

## Shell setup

#### ZSH Theme

https://github.com/romkatv/powerlevel10k

#### ZSH plugin manager

https://github.com/jandamm/zgenom

#### More inspiration

https://github.com/unixorn/zsh-quickstart-kit

## git

Tell git where it can find gpg (fix for obsidian git to be able to commit).

Find gpg path:

```shell
type gpg
```

Configure git to use the full path:

```shell
git config --global gpg.program /usr/local/bin/gpg
```

## bindkey

To find bindkey run `cat` then type the button combination. 
