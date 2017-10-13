function rle --description 'ripgrep search piped into less'
    rg --color=ansi $argv | less -R
end
