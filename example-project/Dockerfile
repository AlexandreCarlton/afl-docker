FROM alexandrecarlton/afl:latest

COPY . /app
RUN $CXX -g -std=c++11 -o /app/maybe-crash /app/maybe-crash.cc
