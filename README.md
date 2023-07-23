# Tmux and zoxide integration script

The script takes a keyword, that you would normally use to move to a directory with zoxide and uses it to either attach or create a tmux session. If session with the directory's name already exists you either attach to it or switch to it from your current session. If a session with that name doesn't exist yet, a new one is created and either attached or switched to.

## How to use

1. Install the required command line tools: [tmux](https://github.com/tmux/tmux/wiki/Installing) and [zoxide](https://github.com/ajeetdsouza/zoxide#installation)
2. Clone this repository
3. Move the script to a bin directory in path variable (I have it in /usr/local/bin/) or add the's script's path to path variable with:

```bash
export PATH="/path/to/script:$PATH"
```

4. Then call the script with:

```bash
tmuxz <directory-keyword>
```
