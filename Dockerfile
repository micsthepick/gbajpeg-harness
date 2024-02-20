FROM aflplusplus/aflplusplus:dev as fuzzgbajpeg

RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    gettext autopoint tmux parallel

ADD gbajpeg /AFLplusplus/gbajpeg
ADD main.c /AFLplusplus/gbajpeg/main.c
ADD Makefile /AFLplusplus/gbajpeg/Makefile.new

WORKDIR /AFLplusplus/gbajpeg

ENV PGM=harness

RUN make -f Makefile.new

ADD runarg.sh /AFLplusplus/gbajpeg/runarg.sh
ADD cmin.sh /AFLplusplus/gbajpeg/cmin.sh
ADD run12tmux.sh /AFLplusplus/gbajpeg/run12tmux.sh
ADD tmin.sh /
ADD seeds-harness /AFLplusplus/seeds-harness