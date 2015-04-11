FROM ubuntu:14.04

ENV UPDATED_AT 2015-04-11

RUN apt-get update

RUN apt-get install -y \
    curl \
    gcc \
    make

RUN curl -L http://cpanmin.us | perl - App::cpanminus

RUN cpanm File::Slurp
RUN cpanm Lingua::EN::Splitter
RUN cpanm Module::Install
RUN cpanm Lingua::Sentence
RUN cpanm Perl6::Form

RUN mkdir /data

COPY bin/ /app/

CMD /app/show_words_count.pl > /data/words; /app/split_into_sentences.pl
