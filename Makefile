        TOOL_DIR=tools
        PREFIX=/usr/local/bin

        # target: all - Default target. Does nothing.
        all:
		cp -f ${TOOL_DIR}/*.sh ${PREFIX}/

        # target: clean - Remove scripts from PREFIX
        clean:
		rm -f ${PREFIX}/generateonepng.sh
		rm -f ${PREFIX}/generatepngall.sh
		rm -f ${PREFIX}/generatepng.sh
		rm -f ${PREFIX}/recolour.sh
		rm -f ${PREFIX}/recolourtopng.sh
