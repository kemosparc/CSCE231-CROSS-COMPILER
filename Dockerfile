FROM kemosparc/auc:debian-stretch

WORKDIR /app
ADD . /app

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nasm gcc g++ make automake autogen subversion git vim texinfo bison flex xz-utils bzip2 -y
RUN chmod a+x /app/build_gcc.sh
RUN /app/build_gcc.sh
