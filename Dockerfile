FROM ubuntu:latest
MAINTAINER Borja Burgos <borja@tutum.co>

# Install Dependencies
RUN apt-get update && \
	apt-get install -y build-essential libx11-dev libgl1-mesa-dev libxext-dev perl perl-modules make curl && \
	apt-get clean

RUN mkdir -p /app && curl -LsS https://github.com/kdlucas/byte-unixbench/archive/v5.1.3.tar.gz | tar -zxf --strip 1 - -C /app && chmod +x /app/UnixBench/Run
WORKDIR /app/UnixBench

ENTRYPOINT ["/app/UnixBench/Run"]
