# Sarajevo DanceHub — Draft ERD (Milestone 1)

```mermaid
erDiagram
    USERS ||--o{ DANCE_CLUBS : manages
    DANCE_CLUBS ||--o{ INSTRUCTORS : has
    DANCE_CLUBS ||--o{ CLASSES : offers
    INSTRUCTORS ||--o{ CLASSES : teaches
    DANCE_STYLES ||--o{ CLASSES : categorizes
    USERS ||--o{ BOOKINGS : makes
    CLASSES ||--o{ BOOKINGS : receives
    USERS ||--o{ REVIEWS : writes
    DANCE_CLUBS ||--o{ REVIEWS : receives

    USERS {
      bigint id PK
      varchar full_name
      varchar email UK
      varchar password_hash
      enum role
    }
    DANCE_CLUBS {
      bigint id PK
      bigint manager_id FK
      varchar name
      varchar address
      varchar area
    }
    INSTRUCTORS {
      bigint id PK
      bigint club_id FK
      varchar full_name
      varchar specialties
    }
    DANCE_STYLES {
      bigint id PK
      varchar name UK
    }
    CLASSES {
      bigint id PK
      bigint club_id FK
      bigint instructor_id FK
      bigint style_id FK
      varchar title
      enum level
      decimal price_monthly
    }
    BOOKINGS {
      bigint id PK
      bigint user_id FK
      bigint class_id FK
      enum status
    }
    REVIEWS {
      bigint id PK
      bigint user_id FK
      bigint club_id FK
      tinyint rating
    }
```

## Relationship notes
- One user can manage multiple clubs (or none).
- One club has many instructors and classes.
- One instructor can teach many classes; each class references one instructor.
- Each class belongs to one dance style.
- Users can book many classes; each booking links one user to one class.
- Users can review clubs; each review belongs to one user and one club.
- `users.role` is planned for role-based access. Managers must only manage clubs associated with their account.
