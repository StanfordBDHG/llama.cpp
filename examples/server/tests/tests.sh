#!/bin/bash

set -eu

if [ $# -lt 1 ]
then
<<<<<<< HEAD
  # Start @llama.cpp scenario
  behave --summary --stop --no-capture --exclude 'issues|wrong_usages' --tags llama.cpp
else
  behave "$@"
fi

=======
    # Start @llama.cpp scenario
    behave --summary --stop --no-capture --exclude 'issues|wrong_usages|passkey' --tags llama.cpp
else
    behave "$@"
fi
>>>>>>> b2776
