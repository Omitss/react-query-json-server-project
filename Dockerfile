FROM jenkins/jenkins:lts-jdk17

USER root

# 기본 패키지 설치
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Node.js 22 설치
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs

# Docker CLI 설치
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | \
    gpg --dearmor -o /usr/share/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Jenkins 플러그인 설치
RUN jenkins-plugin-cli --plugins \
    git \
    github \
    workflow-aggregator \
    docker-workflow \
    pipeline-stage-view

# Docker 권한 설정
RUN groupadd -f docker && \
    usermod -aG docker jenkins

USER jenkins

EXPOSE 8080
EXPOSE 50000