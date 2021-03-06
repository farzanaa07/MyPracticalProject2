# Project2

Avanade Practical Project Specification

**Brief**

The brief provided to us for this project sets the following out as its overall objective: "To create a service-orientated architecture for an application that must be composed of at least 4 services that work together."
This means that I must create a functional web application in ASP.Net using C# and test the code I produce. I must also produce a functional Azure DevOps pipeline that will deploy my code.


**My web application**

I have produced a web application that consists of 4 services that all function together, with service 1 being able to communicate with the 3 other services. This application will generate two random objects - one of which will be a generated number and one that will generate a colour and generate an object that is dependent on the results from the two random objects - this will be a prize. 

Service 1

This acts as the core service that renders the HTML needed to interact with the application. It is responsible for communicating with the other 3 other services. This will be done in MVC C# and will display the random objects as well as the dependent object.

Service 2

This will be one of two services that will generate the random "object". In this case, this service will be a number generator. 

Service 3

This will be one of two services that will generate a random "object". In this case, this service will be a colour generator

Service 4
This service will merge the objects from service 2 and 3 (a colour and a number) and generate a prize that is dependent on the results from the merge. For example, if the colour red and number 1 is generated, a prize of £100. 

**User Journey**

The user will input their name into the frontend home page and a colour and number will be generated for the user. They will need a specific combination of a number and colour to be able to win a prize. The diagram below describes the workflow for the user journey:

![image](https://user-images.githubusercontent.com/70802911/123049838-e6f30080-d3f7-11eb-9cd8-8823afc8ec74.png)


**Frontend design**

First frontend page with user input:
![image](https://user-images.githubusercontent.com/70802911/123227532-939eb200-d4cc-11eb-929e-3d31f114a19e.png)


Second frontend page displaying merged colours and numbers and prize.
![image](https://user-images.githubusercontent.com/70802911/123227681-baf57f00-d4cc-11eb-83f1-4d9d39910c10.png)


**Architecture**

The workflow below shows the way in which the services communicate together to be able to generate objects (number and string generator) that merge together.

![image](https://user-images.githubusercontent.com/70802911/123052221-82857080-d3fa-11eb-8d48-f326f3849306.png)


**CI Pipeline**

![image](https://user-images.githubusercontent.com/70802911/123109573-40c4ec00-d433-11eb-815a-82e4c8802c43.png)
The CI/CD Pipeline above shows:
1. Developer changes application source code.
2. Application code is committed to GitHub repository.
3. Terraform is used to create resources on Visual Studio Code.
4. Terraform files are committed to GitHub.
5. Continous Deployment by GitHub Actions triggers an automated deployment of application.
7. Developer is able to use app service
8. Developer is able to track project using Kanban boards.
9. xUnit Testing is carried out in Visual Studios.

**Implementation**

I was able to show how my application is fully integrated using the Feature-Branch model into GitHub by making a change (e.g. background colour change), pushing this into GitHub and GitHub Actions is able to redeploy the application with the changes.


**Project Tracking**

Jira was used to track the progress of my project and allowed me to look at the different parts of the project so I knew what was needed to be done. I added columns in my Jira board so that there was a column for each of the elements: project planning, coding and testing and deployment. Once I completed my tasks, I would move the tasks to the completed column. I also included a column with all the user stories.
https://farzanaakter1.atlassian.net/secure/RapidBoard.jspa?projectKey=PPS&useStoredSettings=true&rapidView=4&atlOrigin=eyJpIjoiOWIwZjE4MWU1YTQyNDNkZTk1ZmI5ZGY4YzgyMTczMjMiLCJwIjoiaiJ9

![image](https://user-images.githubusercontent.com/70802911/123056325-b498d180-d3fe-11eb-83f3-9e734512a06b.png)


**Testing**

I used XUnit testing to test my controllers. I used repository patterning and mocking to test part of my frontend controller (userinput section) and mocking alone to test my merge and part of my frontend controller. Overall test coverage was 71%. 
![image](https://user-images.githubusercontent.com/70802911/122797576-83fa5000-d2b7-11eb-8ed2-15a4b7d11911.png)


**Risk Assessment**
A screenshot of my risk assessment is shown below. 
![image](https://user-images.githubusercontent.com/70802911/123110686-39521280-d434-11eb-88ea-9601ef121df8.png)

Improvements:
- Add database to the merge controller.
