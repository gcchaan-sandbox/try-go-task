FROM ubuntu:22.04
RUN apt update -y && apt install -y iputils-ping net-tools \
    && apt-get install -y curl less vim bash-completion
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d
RUN curl https://raw.githubusercontent.com/go-task/task/main/completion/bash/task.bash > /root/task.bash \
    && chmod +x /root/task.bash \
    && echo "\
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then \n\
        . /etc/bash_completion \n\
    fi \n\
    source /root/task.bash" \n\
    >> /root/.bashrc
RUN mkdir /workspace
WORKDIR /workspace
RUN task --init
