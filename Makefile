build:
	docker build -t poetrytest .

run:
	docker run -v $$(pwd)/commands.sh:/app/project/commands.sh -it poetrytest /bin/bash commands.sh