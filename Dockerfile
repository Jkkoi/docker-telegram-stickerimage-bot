FROM centos:centos8.3.2011
MAINTAINER Jkkoi

RUN bash

RUN yum update -y
RUN yum install fftw fftw-devel fftw-devel bzip2-devel freetype-devel libjpeg-devel libpng-devel libtiff-devel zlib-devel libtool-ltdl-devel libX11-devel libXext-devel libXt-devel libxml2-devel librsvg2-devel  libwebp libwebp-devel wget  nodejs -y
RUN yum groupinstall "Development tools" -y

RUN wget https://www.imagemagick.org/download/ImageMagick.tar.gz
RUN tar -zxvf ImageMagick.tar.gz
RUN mv ImageMagick-* ImageMagick
WORKDIR ImageMagick
RUN ./configure
RUN make && make install

WORKDIR /

RUN git clone https://github.com/phoenixlzx/telegram-stickerimage-bot
WORKDIR telegram-stickerimage-bot
RUN npm install

RUN echo '#!/bin/bash' >> start.sh
RUN echo 'sed  "s/1234567890:YOURTOKENHERE/`echo $TOKEN`/gi" config.js.example > config.js' >> start.sh
RUN echo 'sed  -i  "s/MyAwesomeStickerBot/`echo $USERNAME`/gi" config.js' >> start.sh
RUN echo 'npm start' >> start.sh
RUN chmod +x start.sh

CMD ls -alh
