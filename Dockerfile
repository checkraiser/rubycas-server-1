FROM vettl/amazon-linux
RUN yum upgrade
RUN git clone git://github.com/rubycas/rubycas-server.git /rubycas-server
RUN cd /rubycas-server && git checkout 23e3852f9f346b73a159b0fa44c849496798f6e2
RUN gem install bundler

RUN echo 'gem "mysql2"' >> /rubycas-server/Gemfile
RUN cd /rubycas-server && bundle install

ADD config.pps.yml  /etc/rubycas-server.yml
ADD run.sh /run.sh

EXPOSE 80
WORKDIR /rubycas-server

CMD ["/run.sh"]
