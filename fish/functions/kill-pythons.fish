function kill-pythons
    ps aux | ag python | ag -v ag | awk '{print $2}' | xargs kill
end
