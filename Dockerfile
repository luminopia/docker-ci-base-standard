FROM node:6.10.2

# Install required packages available from the Debian repo
# NOTE: output isn't cleaned up so base images can easily run install again w/o
# needing to run `apt-get update`
RUN apt-get update && apt-get install -y \
    python=2.7.9-1 \
    python-dev=2.7.9-1 \
    python-pip=1.5.6-5 \
    rsync \
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

# Install git lfs
RUN curl https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh > /root/git-lfs-installer.sh \
    && echo "be7eb90243b46e01201c0ed7055c54fcf25c5832272d8da3d2aa54b3ab6c1f00  /root/git-lfs-installer.sh" | sha256sum -c - \
    && chmod a+x /root/git-lfs-installer.sh \
    && /root/git-lfs-installer.sh \
    && apt-get install git-lfs \
    && git lfs install
