# WebKick

## Overview

WebKick is a Bash script designed to quickly set up a basic web development environment. It creates an initial setup with an HTML file (`index.html`), a CSS file (`styles.css`), a JavaScript file (`script.js`), and a README file (`README.md`). Additionally, it configures the HTML file to include the CSS and JavaScript files and sets up basic styling and structure.

## Usage

### Download

To use WebKick, you have a couple of options to get the script:

- **Clone Repository**: Use Git to clone this repository to your local machine.

git clone https://github.com/Aleesssino/scripts.git

- **Download ZIP**: Click on the "Code" button on the repository page and select "Download ZIP". Extract the downloaded ZIP file to your desired location.

### Running the Script

Once you have downloaded the WebKick script, follow these steps to run it from anywhere in your terminal:

1. **Make it Executable**: Open a terminal and navigate to the directory where the script is saved. Run the following command to make it executable:

chmod +x webkick.sh

2. **Move to PATH Directory**: Move the script to a directory that is included in your system's PATH environment variable. For example:

sudo mv webkick.sh /usr/local/bin/webkick

3. **Run the Script**: Now, you can run the script from anywhere by typing `webkick` in the terminal.

webkick

### Initial Setup

The script will create the initial setup with `index.html`, `styles.css`, `script.js`, and `README.md`. It will also configure `index.html` to include `styles.css` and `script.js`.

### Starting a Development Server (Optional)

If you have `live-server` installed, the script will automatically start a development server after setting up the files. You can access the server by visiting [http://localhost:8080](http://localhost:8080) in your web browser.
