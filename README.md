# Sarajevo_DanceHub
Sarajevo DanceHub is a web application for managing dance studios in Sarajevo, allowing users to browse and book dance classes, register for dance camps and workshops, see upcoming dance events and connect students, instructors and administrators on one platform.
The application provides information about dance styles, available classes, instructors, and dance clubs. Users can browse classes, explore club locations, and manage their bookings. Club managers can manage their clubs, instructors, classes, and related information.
The main goal of Sarajevo DanceHub is to make discovering and participating in dance activities easier by bringing dance clubs and people interested in dancing together through one platform.

1. Entities and Relationships

The database consists of seven main entities:

Users

Dance Clubs

Instructors

Dance Styles

Classes

Bookings

Reviews

-Entity Relationships

One dance club can have multiple instructors.

One dance club can organize multiple classes.

One instructor can teach multiple classes.

One dance style can be associated with multiple classes.

One user can make multiple bookings.

One class can have multiple bookings.

One user can write multiple reviews.

One dance club can receive multiple reviews.

The relationships between users and classes are managed through the Bookings entity, which connects users with the classes they reserve.

2. User Roles and Test Accounts

The application is designed around two main user roles.

Dancer

Dancers can browse dance clubs, explore classes and instructors, register for an account, manage their bookings, and submit reviews.

Club Manager

Club managers can manage their club information, instructors, class schedules, and other club-related information.

3. External API

Sarajevo DanceHub is planned to integrate the OpenStreetMap Nominatim API to support location-related functionality.

API documentation: https://nominatim.org/release-docs/latest/api/Overview/

The API will be used to search for and retrieve geographical coordinates for dance club addresses. This information will support displaying dance club locations on a map and helping users identify where clubs are located in Sarajevo.

The integration will be implemented as part of the backend development.

4. Technologies Used

The project is planned to use the following technologies:

Frontend: HTML, CSS, JavaScript, Bootstrap 5.

Backend: PHP and FlightPHP REST API.

Database: MySQL.

Database Access: PDO.

Authentication: JSON Web Tokens (JWT).

API Documentation: OpenAPI / Swagger.

External API: OpenStreetMap Nominatim.

Version Control: Git and GitHub.

5. Project Status

The current version represents Milestone 1 and focuses on the frontend prototype, initial database design, project structure, and documentation.

Backend endpoints, database connectivity, authentication, role-based authorization, external API integration, and public deployment will be implemented in subsequent development milestones.
