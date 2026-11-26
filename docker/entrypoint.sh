#!/usr/bin/env bash
set -euo pipefail
cd /home/runner/actions-runner

# Virtual display for matlab.uitest
rm -f /tmp/.X99-lock
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99

if [ ! -f .runner ]; then
  ./config.sh --unattended --replace \
    --url "https://github.com/${REPO}" \
    --token "${RUNNER_TOKEN}" \
    --name "${RUNNER_NAME}" \
    --labels "gpu,matlab" \
    --work _work
fi
exec ./run.sh
