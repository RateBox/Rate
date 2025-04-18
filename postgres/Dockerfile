FROM postgres:17.4

# Thêm các cấu hình tùy chỉnh nếu cần
COPY ./postgresql.conf /etc/postgresql/postgresql.conf

CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"] 