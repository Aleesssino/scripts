#!/bin/bash

# Function to check if live-server is installed
check_live_server() {
	npm list -g live-server &>/dev/null
	return $?
}

# Function to install live-server
install_live_server() {
	npm install -g live-server
}

# Function to prompt user to install live-server
prompt_install_live_server() {
	read -p "live-server is not installed. Do you want to install it now? (y/n): " install_choice
	if [ "$install_choice" == "y" ]; then
		install_live_server
		echo "live-server installed."
	else
		echo "live-server not installed. Exiting."
		exit 1
	fi
}

# Check if live-server is installed
check_live_server
if [ $? -eq 1 ]; then
	prompt_install_live_server
fi

# Get the name of the current directory
folder_name=$(basename "$(pwd)")

# Create index.html with HTML skeleton
echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>$folder_name</title>
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

echo "Initial setup completed."

# Start live-server
echo "Starting live-server..."
live-server --port=8080 &
echo "live-server started. Visit http://localhost:8080"
