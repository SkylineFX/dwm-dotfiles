#!/bin/sh

#refresh the bar by killing the sleep instance in dwmbar
kill "$(pstree -lp | grep -- -dwmbar | sed "s/.*sleep(\([0-9]\+\)).*/\1/")"

#original command(does not work)
#pstree -lp | grep  -- -dwmbar\([0-9] | sed "s/.*sleep(\([0-9]\+\)).*/\1/"
