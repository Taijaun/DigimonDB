# DigimonDB
This app currently displays a list of the Agumon digimon cards from the Digimon API: https://documenter.getpostman.com/view/14059948/TzecB4fH#5d82e651-26d7-4c58-8b9a-f021f5cc1dfd

# Installation
Can be used with Xcode 14 and above. compatiable with both iPhone and iPad running ios 16 or later.

# Framework
SwiftUI, WKWebkit, Kingfisher, CoreData.

# Architecture
This app uses MVVMC for the views and a coordinator for routing.

# Storage
This app uses offline storage in the form of CoreData.

# Design Patterns
Async await, Protocols

# Testing
Unit tests for success and failure on api calls, Mocked the responses using dummy data json files and a mock NetworkAPIManager

# Screenshots
<img src="https://github.com/Taijaun/DigimonDB/assets/68790661/4276e3ad-b660-4645-9a8a-1665976cf3c4" alt="HomePage" width="500" height="600">
![Simulator Screenshot - iPhone 14 Pro - 2023-05-30 at 09 25 23](https://github.com/Taijaun/DigimonDB/assets/68790661/4276e3ad-b660-4645-9a8a-1665976cf3c4)

![Simulator Screenshot - iPhone 14 Pro - 2023-05-30 at 09 26 05](https://github.com/Taijaun/DigimonDB/assets/68790661/05026392-9600-4ebd-a887-381a50459b2c)

![Simulator Screenshot - iPhone 14 Pro - 2023-05-30 at 09 26 29](https://github.com/Taijaun/DigimonDB/assets/68790661/054a3b90-c982-4bda-afdb-2d3e50cbd181)

