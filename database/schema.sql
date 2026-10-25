-- Sarajevo DanceHub — draft schema for Milestone 1.
-- Demo data will be added after the schema is reviewed.
CREATE DATABASE IF NOT EXISTS sarajevo_dancehub CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sarajevo_dancehub;

CREATE TABLE users (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(120) NOT NULL,
  email VARCHAR(190) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('dancer','manager','admin') NOT NULL DEFAULT 'dancer',
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dance_clubs (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  manager_id BIGINT UNSIGNED NULL,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  address VARCHAR(255) NOT NULL,
  area VARCHAR(100),
  latitude DECIMAL(10,7) NULL,
  longitude DECIMAL(10,7) NULL,
  email VARCHAR(190),
  phone VARCHAR(40),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_clubs_manager FOREIGN KEY (manager_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE instructors (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  club_id BIGINT UNSIGNED NOT NULL,
  full_name VARCHAR(120) NOT NULL,
  bio TEXT,
  specialties VARCHAR(255),
  photo_url VARCHAR(500),
  CONSTRAINT fk_instructors_club FOREIGN KEY (club_id) REFERENCES dance_clubs(id) ON DELETE CASCADE
);

CREATE TABLE dance_styles (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  description TEXT
);

CREATE TABLE classes (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  club_id BIGINT UNSIGNED NOT NULL,
  instructor_id BIGINT UNSIGNED NOT NULL,
  style_id BIGINT UNSIGNED NOT NULL,
  title VARCHAR(150) NOT NULL,
  description TEXT,
  level ENUM('Beginner','Intermediate','Advanced','All levels') NOT NULL DEFAULT 'All levels',
  schedule_text VARCHAR(150) NOT NULL,
  price_monthly DECIMAL(8,2) NOT NULL DEFAULT 0,
  capacity INT UNSIGNED NOT NULL DEFAULT 20,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_classes_club FOREIGN KEY (club_id) REFERENCES dance_clubs(id) ON DELETE CASCADE,
  CONSTRAINT fk_classes_instructor FOREIGN KEY (instructor_id) REFERENCES instructors(id) ON DELETE RESTRICT,
  CONSTRAINT fk_classes_style FOREIGN KEY (style_id) REFERENCES dance_styles(id) ON DELETE RESTRICT
);

CREATE TABLE bookings (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  class_id BIGINT UNSIGNED NOT NULL,
  status ENUM('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  booked_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_booking_user_class UNIQUE (user_id, class_id),
  CONSTRAINT fk_bookings_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_bookings_class FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE CASCADE
);

CREATE TABLE reviews (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  club_id BIGINT UNSIGNED NOT NULL,
  rating TINYINT UNSIGNED NOT NULL,
  comment TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_review_rating CHECK (rating BETWEEN 1 AND 5),
  CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  CONSTRAINT fk_reviews_club FOREIGN KEY (club_id) REFERENCES dance_clubs(id) ON DELETE CASCADE
);
