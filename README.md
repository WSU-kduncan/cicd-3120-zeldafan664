## Part 1 - Dockerize it

### Documentation
- Project Overview
  - The project will host a simple website built in html with some css for styling and javascript functionality. 
- Run Project Locally
  - I installed Docker in one of my previously built instances. 
    - First, I made sure to uninstall and old versions that I mgiht have been messing around with just to start with a clean slate 
    -  sudo apt-get remove docker docker-engine docker.io containerd runc
    - Next, I setup the repository with: 
        - sudo apt-get install \
        - ca-certificates \
        - curl \
        - gnupg \
        - lsb-release
    - Next, add Docker's GPG Key: 
     -  sudo mkdir -p /etc/apt/keyrings
     -  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    - Next, install the Docker engine
     -  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  - how to build the container from the Dockerfile
    - After configuring the Dockerfile, use the command sudo docker build -t project5 .
  - how to run the container
    - To run the container:  sudo docker run -d -p 8080:80 --name project5site project5

  - how to view the project running in the container (open a browser...go to ip and port...)
    - To view the project running in the container, go to a browser like Firefox and in the search bar, enter the public ip followed by the port the project is bound to, in this case, 3.234.135.188:8080
    
    ![project running](https://user-images.githubusercontent.com/84351411/202752570-1ffd1b91-b235-4152-94cb-78af6dbaed11.png)
## Part 2 - GitHub Actions and DockerHub
### Documentation
  - Process to create public repo in DockerHub: After creating your account, simply go to create repository, give it a name and description, then submit. 
  - To authenticate in DockerHub CLI, you will need your username and an access token created on DockerHub, with permissions to read and write. In your terminal, use the comman "sudo docker login - u "type-your-username" and hit enter. When prompted for the password, paste in your freshly created Docker Token. 
  - To push a container to DockerHub (assuming you have one created locally) use the command "sudo docker push docker tag local-image:tagname new-repo:tagname
  - GitHub Secrets: the secrets that were set were DOCKER_USERNAME and DOCKER_TOKEN. 
  - The workflow sets up the job, sets up the QEMU, sets up Docker Buildx, Lists Contents, Login to DockerHub, Build and Push, Post Login to Docker Hub, Post Set up Docker Buildx, Complete Job 
  - If someone else were going to use my project, then they would need an access token of their own. 
## Part 3 - Deployment

### Documentation
  - Description of container restart script: (Included the script in main if you want to look at that as well)
    - pulls the latest version of the image from my dockerhub repository
    - Removes the unused images with prune 
    - stops and removes the container
    - Recreates and runs the container
  
  - Setting up the webhook: 
    - Sudo apt-get install hook
    - make the webhook task file 
    - webhook -hooks p5hook.json -verbose
    - Webhook File Stuff: 
      - creates an ID called ENDPOINT-NAME
      - Executes the refresh script from the defined working directory
      - Trigger rules set value and tokens to use when creating the DockerHub hook
  - Creating notifier on DockerHub:
    - In your repo, click the Webhooks tab
    - Give it a name!
    - For the Webhook URL, use something like http://InstanceIP:9000/id?TARGET_PARAMETER=TARGET_TOKEN
    - (in my case): http://3.234.135.188:9000/hooks/id?p5_param=P5_TOKEN
   
 
