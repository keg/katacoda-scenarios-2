printf 'eval "$(direnv hook bash)"' >> /root/.bashrc
mkdir /etc/datadog-agent
apt install direnv
# echo "echo 'This directory is actually located at /etc/datadog-agent'" > /etc/datadog-agent/.envrc
ln -s /etc/datadog-agent /root/vmfiles
mkdir /root/dockerfiles