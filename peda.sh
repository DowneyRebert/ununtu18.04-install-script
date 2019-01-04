#!/bin/bash

echo "staring peda installation..."

git clone git://github.com/eatmanCTF/peda.git ~/.tools/peda-heap
echo "source ~/.tools/peda-heap/peda.py" >> ~/.gdbinit

echo "peda installation is complete!"
