FROM node:6.10.2

# Install required packages available from the Debian repo
# NOTE: output isn't cleaned up so base images can easily run install again w/o
# needing to run `apt-get update`
RUN apt-get update && apt-get install -y \
    python=2.7.9-1 \
    python-dev=2.7.9-1 \
    python-pip=1.5.6-5 \
    shellcheck=0.3.4-3 \
    unzip=6.0-16+deb8u3

# Install pip based packages
RUN pip install \
    pre-commit==0.14.0 \
    awscli==1.11.93

# Install terraform
RUN curl https://releases.hashicorp.com/terraform/0.9.6/terraform_0.9.6_linux_amd64.zip > /root/terraform.zip \
    && echo "7ec24a5d57da6ef7bdb5a3003791a4368489b32fa93be800655ccef0eceaf1ba /root/terraform.zip" | sha256sum -c - \
    && unzip /root/terraform.zip -d /usr/local/bin \
    && rm /root/terraform.zip
