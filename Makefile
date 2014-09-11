# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                             #
#    Copyright (C) 2012-2014 Chuan Ji <jichuan89@gmail.com>                   #
#                                                                             #
#    Licensed under the Apache License, Version 2.0 (the "License");          #
#    you may not use this file except in compliance with the License.         #
#    You may obtain a copy of the License at                                  #
#                                                                             #
#     http://www.apache.org/licenses/LICENSE-2.0                              #
#                                                                             #
#    Unless required by applicable law or agreed to in writing, software      #
#    distributed under the License is distributed on an "AS IS" BASIS,        #
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. #
#    See the License for the specific language governing permissions and      #
#    limitations under the License.                                           #
#                                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

CXXFLAGS := -Wall -O3 -std=c++1y
LIBS := -lpthread -lform -lncurses -lfreetype -ljbig2dec -ljpeg -lz -lopenjp2 -lmupdf -lmujs -lssl -lcrypto
JFBVIEW_LIBS := $(LIBS) -lImlib2

SRCS := $(wildcard *.cpp)


all: jfbview

.PHONY: lint
lint:
	cpplint \
	    --extensions=hpp,cpp \
	    --filter=-build/c++11 \
	    *.{h,c}pp

.PHONY: clean
clean:
	-rm -f *.o *.d jfbview jfbpdf

%.d: %.cpp
	@$(SHELL) -ec '$(CXX) -MM $(CXXFLAGS) $< \
	  | sed '\''s/\($*\)\.o[ :]*/\1.o $@ : /g'\'' > $@; \
	  [ -s $@ ] || rm -f $@'
-include $(SRCS:.cpp=.d)

jfbview: $(SRCS:.cpp=.o)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDLIBS) $(JFBVIEW_LIBS)

jfbpdf: $(SRCS)
	$(CXX) \
	    -DJFBVIEW_NO_IMLIB2 \
	    -DJFBVIEW_PROGRAM_NAME=\"JFBPDF\" \
	    -DJFBVIEW_BINARY_NAME=\"$@\" \
	    $(CXXFLAGS) -o $@ $^ \
	    $(LDLIBS) $(LIBS)
