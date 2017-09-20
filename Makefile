TARGET =monitor
IDIR =include
ODIR =build
SRC_DIR =src
CXX=g++-4.9
CXXFLAGS=-std=c++11 -Wall -I$(IDIR)
LIBS=
_DEPS = SerialCommunication.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = SerialCommunication.o main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: src/%.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

$(TARGET): $(OBJ)
	$(CXX) -o $@ $^ $(LIBS) $(CXXFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ exec
