This read me file will explan how I dockerized my react file

The first step is to create a dockerfile in the root directory of your react application
in the docker file you will need to, in order, create:

FROM node:[insert node version here]
# this will allow docker access to your node version which will help it run properly

WORKDIR /[name of work dierctory here]
# this will setup a work directory as you named it insode the container

# Copy package.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application files
COPY . .

# Expose the port your application runs on when you first started it
EXPOSE [insert port of app here]

##  this will make sure that your container will run on localhost(IMPORTANT)
ENV HOST=0.0.0.0

# Define the command to run your app
CMD ["npm","run", "dev", "--", "--host", "0.0.0.0"]
# note the CMD will be different depending on what react config you use since I used vite + react I used npm run dev to start my application the last three lines will make sure it host a localhost server

once you have created the Dockerfile you can create an optional ".dockerignore" file to make it run smoother
in the .dockerignore file paste the following:

node_modules
npm-debug.log
build
.git
*.md
.gitignore

# these will now be ignored by the container

if you do not have a react file run:
npm create vite@latest my-react-app
# then answer the following questions
# make sure you have the proper installations

Now you will run the following commands in your command line once you have redirected to your react file:
# note my-react-app can be changed to whatever name you want

docker build -t my-react-app .
## my-react-app will be the name of your docker image you can change this to what you want

## this command
docker run -p 7775:5173 my-react-app
## make sure that my-react-app equals thesame name you named your image above
## setting it to 7775:5173 will allow the application to run on localhost:7775 and 5173 is the EXPOSE you set in your Dockerfile

## if you want to rename the docker container run this command
docker rename current_container_name new_name
## needless to say change the names in the command to their repective values