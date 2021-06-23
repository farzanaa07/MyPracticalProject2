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


**Architecture**

The workflow below shows the way in which the services communicate together to be able to generate objects (number and string generator) that merge together.

![image](https://user-images.githubusercontent.com/70802911/121028956-1f5fd100-c7a0-11eb-83bf-6bd265f2f4d9.png)

**Project Tracking**

Jira was used to track the progress of my project and allowed me to look at the different parts of the project so I knew what was needed to be done.
https://farzanaakter1.atlassian.net/secure/RapidBoard.jspa?projectKey=PPS&useStoredSettings=true&rapidView=4&atlOrigin=eyJpIjoiOWIwZjE4MWU1YTQyNDNkZTk1ZmI5ZGY4YzgyMTczMjMiLCJwIjoiaiJ9

**Testing**
![image](https://user-images.githubusercontent.com/70802911/122797576-83fa5000-d2b7-11eb-8ed2-15a4b7d11911.png)



