#!/bin/bash

#refresh the bar by killing the sleep instance in dwmbar
kill "$(pstree -lp | grep -- -dwmbar | sed "s/.*sleep(\([0-9]\+\)).*/\1/")"
#kill -44 $(pidof dwmblocks) (for dwmblocks)
