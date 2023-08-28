aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 036531232259.dkr.ecr.us-east-1.amazonaws.com

docker build -t sprint3-compass -f Dockerfile .

docker tag sprint3-compass:latest 036531232259.dkr.ecr.us-east-1.amazonaws.com/sprint3-compass:latest

docker push 036531232259.dkr.ecr.us-east-1.amazonaws.com/sprint3-compass:latest