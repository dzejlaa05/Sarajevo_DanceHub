# AGENTS.md — Sarajevo DanceHub

## Project description
Sarajevo DanceHub is a web application for discovering and managing dance clubs and classes in Sarajevo, Bosnia and Herzegovina.

## Technology stack
- Frontend: HTML5, CSS3, vanilla JavaScript, Bootstrap 5.
- Backend (later milestones): PHP 8.1+, FlightPHP REST API, PDO, JWT.
- Database: MySQL.
- API documentation: OpenAPI/Swagger.
- Planned external API: OpenStreetMap Nominatim for location lookup/map-related club discovery.

## Architecture rules
- Keep frontend and backend separate. Frontend files contain only HTML, CSS and JavaScript; REST endpoints and business logic belong in PHP.
- The backend must use FlightPHP and PDO; do not replace these requirements with another framework or database library.
- Use JSON request/response bodies for the REST API.
- Use JWT middleware for authentication and reusable role authorization middleware.
- Add reusable request logging and error-handling middleware.
- Do not commit credentials, JWT secrets, API keys, logs, or `vendor/`.
- Never put secrets in frontend JavaScript.
- Treat all data currently in `frontend/js/app.js` as placeholder/demo data. In later milestones replace it with AJAX calls to the REST API.
- Make all pages responsive and keep SPA navigation without full page reloads.
- Validate user input on both frontend and backend. Hash passwords with PHP `password_hash`; verify with `password_verify`.
- Use prepared statements through PDO; do not concatenate user input into SQL.
- External API requests must have a timeout and graceful fallback. Log failures without breaking the rest of the application.
- Update `AGENTS.md` and `docs/AI_LOG.md` at every milestone.

## Folder structure
- `frontend/`: SPA shell, styles, JavaScript, page templates/assets.
- `backend/routes/`: FlightPHP route definitions.
- `backend/services/`: business logic.
- `backend/dao/`: PDO database access.
- `backend/middleware/`: authentication, authorization, logging, error handling.
- `backend/config/`: local configuration; only `config.example.php` is tracked.
- `backend/logs/`: local runtime logs, excluded from Git.
- `database/`: SQL schema.
- `docs/`: ERD, OpenAPI documentation, AI usage log.

## Naming conventions
- MySQL tables and columns use `snake_case`.
- JavaScript variables and functions use `camelCase`.
- PHP classes use `PascalCase`; files should match class names.
- REST resources use plural nouns, e.g. `/api/classes`, `/api/clubs`.
- Return consistent JSON responses and appropriate HTTP status codes.

## AI assistant instructions
- Explain commands before asking the student to run them.
- Do not claim a feature is backend-connected until the API implementation and integration are complete.
- Do not invent test accounts or claim deployment exists before it is configured.
- When changing a file, preserve the frontend/backend separation and update relevant documentation.
