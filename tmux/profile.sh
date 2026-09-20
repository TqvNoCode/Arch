#!/bin/bash
profile=$(tlpctl get 2>/dev/null)

'''
if [ "$profile" = "performance" ]; then
    echo "🔥 Perf"
elif [ "$profile" = "balanced" ]; then
    echo "⚖️ Bal"
elif [ "$profile" = "low-power" ]; then
    echo "🍃 Quiet"
else
    echo "❓ N/A"
fi
'''

# Easy readable code
case "$profile" in
    performance) echo "🔥 Perf" ;;
    balanced) echo "⚖️ Bal" ;;
    power-saver) echo "🍃 Quiet" ;;
    *) echo "❓ N/A" ;;
esac
