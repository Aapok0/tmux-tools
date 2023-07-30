# Tmux, zoxide and fzf integration scripts

## tmuxz

The script takes a keyword, that you would normally use to move to a directory with zoxide and uses it to either attach or create a tmux session. If session with the directory's name already exists you either attach to it or switch to it from your current session. If a session with that name doesn't exist yet, a new one is created and either attached or switched to.

## tmuxf

Same as tmuxz, but you don't give any keyword. The script opens a fuzzy finder (fzf) window for all directories in zoxide database. Write in the field to narrow down and choose the directory you want. The rest of it works the same way as tmuxz.

## How to use

1. Install the required command line tools: [tmux](https://github.com/tmux/tmux/wiki/Installing), [zoxide](https://github.com/ajeetdsouza/zoxide#installation) and [fzf](https://github.com/junegunn/fzf#installation)
2. Clone this repository
3. Add the script to path in one of the following ways: 
    - Move the scripts to a bin directory in path variable (for example /usr/local/bin)
    - Make symbolic links of the scripts to a bin directory in path variable (for example /usr/local/bin):

```bash
ln -sT /absolute/path/to/script-name /usr/local/bin/script-name
```

    - Add the scripts' path to path variable with:

```bash
export PATH="/path/to/script:$PATH"
```

4. Then call either script with:

```bash
tmuxz <directory-keyword>
tmuxf
```
