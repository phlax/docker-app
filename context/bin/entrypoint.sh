#!/bin/bash

/usr/local/bin/prepare-container
cd $APP_SRC_DIR

CMD=${@:-$COMMAND}

export HOME=/home/$APP_USERNAME
exec gosu $APP_USERNAME $CMD
