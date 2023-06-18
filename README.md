# SwiftUI Popular Movies App

This is a sample iOS app built with SwiftUI, MVVM (Model-View-ViewModel) architecture, Combine framework, and Clean Architecture principles. The app displays a list of popular movies fetched from the MovieDB API and allows users to view movie details.

## Features

- Fetches a list of popular movies from the MovieDB API
- Displays movie posters in a scrollable list
- Tapping on a movie poster shows the movie details screen
- Movie details screen shows additional information about the selected movie

![](https://github.com/pradeepgian/SwiftUI-Popular-Movies-App/blob/main/PopularMovies-App.gif)

## MVVM (Model-View-ViewModel)

MVVM is the architectural pattern used in the app. The main components are:

- **View**: SwiftUI views responsible for displaying UI elements and responding to user interactions.
- **ViewModel**: Acts as an intermediary between the view and the domain layer.
- **Model**: Represents the data structures and entities used in the app.

The view binds to the view model and updates its UI based on the state changes. The view model interacts with the domain layer to fetch and process data.

## Combine Framework

The Combine framework is utilized for reactive programming and handling asynchronous operations. It enables publishers and subscribers to communicate and react to data changes. 
The app uses Combine to handle API requests, data transformation, and state updates.

## Credits

The app uses the [MovieDB API](https://www.themoviedb.org/documentation/api) to fetch movie data.

## License

This project is licensed under the [MIT License](LICENSE).
