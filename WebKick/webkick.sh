#!/bin/bash

# Function to check if live-server is installed
checkLiveServer() {
	npm list -g live-server &>/dev/null
	return $?
}

# Function to install live-server
installLiveServer() {
	npm install -g live-server
}

# Function to check if nodemon is installed
checkNodemon() {
	npm list -g nodemon &>/dev/null
	return $?
}

# Function to install nodemon
installNodemon() {
	npm install -g nodemon
}

# Function to prompt user to install live-server
promptInstallLiveServer() {
	read -p "live-server is not installed. Do you want to install it now? (y/n): " installChoice
	if [ "$installChoice" == "y" ]; then
		installLiveServer
		echo "live-server installed."
	else
		echo "live-server not installed. Exiting."
		exit 1
	fi
}

# Function to prompt user to install nodemon
promptInstallNodemon() {
	read -p "nodemon is not installed. Do you want to install it now? (y/n): " installChoice
	if [ "$installChoice" == "y" ]; then
		installNodemon
		echo "nodemon installed."
	else
		echo "nodemon not installed. Exiting."
		exit 1
	fi
}

# Function to prompt user to use TypeScript
promptUseTypeScript() {
	read -p "Do you want to use TypeScript? (y/n): " tsChoice
	if [ "$tsChoice" == "y" ]; then
		setupTypeScript
		echo "TypeScript setup completed."
	else
		echo "Proceeding without TypeScript."
	fi
}

# Function to setup TypeScript
setupTypeScript() {
	npm install -g typescript
	tsc --init
	mv script.js script.ts
	echo "document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM loaded');
    // Your TypeScript code here
});" >script.ts
	echo "script.ts created with event listener."
}

# Check if live-server is installed
checkLiveServer
if [ $? -eq 1 ]; then
	promptInstallLiveServer
fi

# Check if nodemon is installed
checkNodemon
if [ $? -eq 1 ]; then
	promptInstallNodemon
fi

# Get the name of the current directory
folderName=$(basename "$(pwd)")

# Create index.html with HTML skeleton
echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>$folderName</title>
    <link rel=\"stylesheet\" href=\"styles.css\">
    <script src=\"script.js\" defer></script>
</head>
<body>
    <div class=\"container\">
        <h1>Hello, World!</h1>
    </div>
</body>
</html>" >index.html

echo "index.html created."

# Create styles.css with initial styles
echo "* {
  box-sizing: border-box;
}

body {
    background-color: black;
    color: white;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}" >styles.css

echo "styles.css created with initial styles."

# Create script.js with event listener
echo "document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM loaded');
    // Your JavaScript code here
});" >script.js

echo "script.js created with event listener."

# Create README.md if not exists
touch README.md
echo "README.md created."

# Prompt user for TypeScript setup
promptUseTypeScript

echo "Initial setup completed."

# Start live-server with nodemon
echo "Starting live-server with nodemon..."
nodemon --watch . --ext js,css,html --exec "live-server --port=8080"
echo "nodemon and live-server started. Visit http://localhost:8080"
