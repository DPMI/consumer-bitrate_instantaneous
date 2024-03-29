# Time-stamp: <02/11/09 10:40:24 INGA>
# File: Makefile
# LinkAggregator
#clients
#g++ -c bitrate_modified_feb_2012.cpp 
#g++ -o bitrate bitrate_modified_feb_2012.o

CFLAGS  += -Wall -g -O0
LDFLAGS +=
PREFIX=/usr/local
OBJECTd= main.o
targetd= instantaneous_bitrate

all: $(OBJECTd)	
	$(CXX) -o $(targetd) $(LDFLAGS) $(OBJECTd) $(shell pkg-config libcap_utils-0.7 libcap_filter-0.7 --libs) -lqd

clean:
	rm -f *.o $(OBJECTd)

install: instantaneous_bitrate
	install -m 0755 instantaneous_bitrate $(PREFIX)/bin

main.o: main.cpp
	$(CXX) $(CFLAGS) $(shell pkg-config libcap_stream-0.7 --cflags) -c main.cpp -o main.o
