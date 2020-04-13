#!/bin/bash -e

CMD=${@:-$COMMAND}

if [ ! -z "$RUN_AS_ROOT" ]; then
    exec "$CMD"
else
    /usr/local/bin/prepare-container
    cd $APP_SRC_DIR
    export HOME=/home/$APP_USERNAME
    exec gosu $APP_USERNAME $CMD
fi
