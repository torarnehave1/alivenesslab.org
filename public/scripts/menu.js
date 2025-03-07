// loadMenuAndLogo.js

// Define the function
function loadMenuAndLogo() {
    fetch('./menu.html')
      .then(response => response.text())
      .then(data => {
        document.getElementById('menu-container').innerHTML = data;
        loadLogo(); // Call loadLogo after inserting menu.html
        loadAppDescription(); // Call loadAppDescription after inserting menu.html
        loadAppSlogan(); // Call loadAppSlogan after inserting menu.html
        loadAppTitle(); // Call loadAppName after inserting menu.html
      })
      .catch(error => console.error('Error loading menu:', error));
  }
  


//Get the app name
function loadAppTitle() {
    fetch('/cnf/app-title')
      .then(response => response.json())
      .then(data => {
        const appNameElement = document.getElementById('appTitle');
        if (appNameElement) {
          appNameElement.innerText = data.appTitle;
        } else {
          console.error("App Name element not found in the DOM.");
        }
      })
      .catch(error => console.error('Error fetching app name:', error));
  }

//Get the app slogan

function loadAppSlogan() {
    fetch('/cnf/app-slogan')
      .then(response => response.json())
      .then(data => {
        const appSloganElement = document.getElementById('appSlogan');
        if (appSloganElement) {
          appSloganElement.innerText = data.appSlogan;
        } else {
          console.error("App Slogan element not found in the DOM.");
        }
      })
      .catch(error => console.error('Error fetching app slogan:', error));
  }


//set the appDescription to the value of the appDescription from the .env file
  function loadAppDescription() {
    fetch('/cnf/app-description')
      .then(response => response.json())
      .then(data => {
        const appDescriptionElement = document.getElementById('appDescription');
        if (appDescriptionElement) {
          appDescriptionElement.innerText = data.appDescription;
        } else {
          console.error("App Description element not found in the DOM.");
        }
      })
      .catch(error => console.error('Error fetching app description:', error));
  }


  // Define loadLogo function to be called within loadMenuAndLogo
  function loadLogo() {
    fetch('/cnf/application-logo')
      .then(response => response.json())
      .then(data => {
        const logoElement = document.getElementById('logo');
        if (logoElement) {
          logoElement.src = data.applicationLogo;
        } else {
          console.error("Logo element not found in the DOM.");
        }
      })
      .catch(error => console.error('Error fetching logo URL:', error));
  }
  
  // Add event listener to run the function after DOM content loads
  document.addEventListener("DOMContentLoaded", loadMenuAndLogo);
  