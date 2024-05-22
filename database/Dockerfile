FROM postgres:16.2-alpine
#RUN sed -e "s/[#]\?listen_addresses = .*/listen_addresses = '*'/g" -i '/var/lib/postgresql/data/postgresql.conf'
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
CMD ["docker-entrypoint.sh", "postgres"]
