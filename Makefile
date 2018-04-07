CXX	= g++
CXXFLAGS= -std=c++11 -g

TARGET	= tui.a
OBJS	= tui/config.o tui/keyboard.o

%.o : %.cc
	$(CXX) $(CXXFLAGS) -c $< -o $@

default:
	make $(TARGET)
	make -C test

clean:
	rm -f $(TARGET)
	rm -f $(OBJS)

$(TARGET) : $(OBJS)
	ar rcs $@ $(OBJS)

test: test.o tui.a
	$(CXX) test.o tui.a -o $@
