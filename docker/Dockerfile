ARG MATLAB_RELEASE=r2024b
FROM mathworks/matlab-deps:${MATLAB_RELEASE}
ARG MATLAB_RELEASE

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl jq git sudo ca-certificates xvfb \
    && rm -rf /var/lib/apt/lists/*

# MATLAB plus the toolboxes listed in the README
RUN wget -q https://www.mathworks.com/mpm/glnxa64/mpm && chmod +x mpm \
    && ./mpm install --release=${MATLAB_RELEASE} --destination=/opt/matlab \
       --products MATLAB Image_Processing_Toolbox Parallel_Computing_Toolbox Statistics_and_Machine_Learning_Toolbox \
    && rm -f mpm \
    && ln -s /opt/matlab/bin/matlab /usr/local/bin/matlab

# Runner user, X11 socket dir for Xvfb, persistent CUDA JIT cache dir, and
# startup.m enabling forward compatibility (Blackwell, CC 12.0, is newer than
# the CUDA libraries bundled with R2024b)
RUN useradd -m runner && echo "runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /tmp/.X11-unix /home/runner/.nv /home/runner/Documents/MATLAB \
    && chmod 1777 /tmp/.X11-unix \
    && echo "try, parallel.gpu.enableCUDAForwardCompatibility(true); catch, end" > /home/runner/Documents/MATLAB/startup.m

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility \
    CUDA_CACHE_MAXSIZE=4294967296

WORKDIR /home/runner/actions-runner
RUN V=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | jq -r .tag_name | sed 's/^v//') \
    && curl -fsSL -o r.tar.gz https://github.com/actions/runner/releases/download/v${V}/actions-runner-linux-x64-${V}.tar.gz \
    && tar xzf r.tar.gz && rm r.tar.gz \
    && ./bin/installdependencies.sh \
    && chown -R runner:runner /home/runner

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER runner
ENTRYPOINT ["/entrypoint.sh"]
