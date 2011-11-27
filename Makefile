        TOOL_DIR=tools
        PREFIX=/usr/local/bin

        all:
		echo "Run 'make install' from root user.\nIt install the script in '$PREFIX', if you want change path please edit Makefile and change PREFIX variable"

        install:
		cp -f ${TOOL_DIR}/*.sh ${PREFIX}/