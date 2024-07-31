# task_code
  

This document describes the process of building the app based on a Figma design. 

  

Project Setup 

  

To create the project, I used the following command: 

  

``` 

flutter create "project_name" 

``` 

  

The primary focus of the application is the `lib` folder, which contains the following subfolders: 

  

- helpers: This folder contains various widgets used within the Home widget. These widgets help in organizing the code for better readability and maintainability. Each file in this folder serves a specific purpose, such as fetching data for all chefs, top chefs, browsing categories, etc. 

  

- constants: This folder contains constants like color schemes and text styles, which simplify the code and ensure consistency throughout the app. We need this, for example, when we want to toggle to dark mode; we only change one file. 

  

- data: This folder houses the JSON file containing the app's data, such as sellers, categories, and other information. Other files within the project fetch data from this JSON file as needed. If you make changes to this data, the new data will be updated. 

  

- pages: This folder includes all the pages required for the app. Currently, it contains the home page, but new pages will be added here as the app develops. 
