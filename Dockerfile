FROM ruby:3.2-slim

RUN apt-get update -qq \
  && apt-get install -y \
  # Needed for certain gems
  build-essential \
  wget

RUN gem install dawnscanner --version '2.1.1'
RUN wget https://github.com/thesp0nge/dawnscanner_knowledge_base/releases/latest/download/kb.tar.gz
RUN rm -rf /root/dawnscanner/kb; mkdir -p /root/dawnscanner/kb; tar xfvz kb.tar.gz -C /root/dawnscanner/kb

WORKDIR /code
ENTRYPOINT ["dawn"]
