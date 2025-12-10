

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS listens;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS subscription_payments;
DROP TABLE IF EXISTS user_subscriptions;
DROP TABLE IF EXISTS subscription_plans;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS countries;

SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code CHAR(2) NOT NULL UNIQUE,

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    birth_date DATE NOT NULL,
    country_id INT NOT NULL,
    registration_date DATETIME NOT NULL DEFAULT NOW(),

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1,

    CONSTRAINT fk_users_countries FOREIGN KEY (country_id)
        REFERENCES countries(country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE subscription_plans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE, 
    monthly_price DECIMAL(10,2) NOT NULL,
    max_members INT NULL,

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE user_subscriptions (
    user_subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    status VARCHAR(20) NOT NULL, 

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1,

    CONSTRAINT fk_us_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_us_plan FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE subscription_payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_subscription_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1,

    CONSTRAINT fk_pay_us FOREIGN KEY (user_subscription_id)
        REFERENCES user_subscriptions(user_subscription_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    country_id INT NULL,

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1,

    CONSTRAINT fk_artists_country FOREIGN KEY (country_id)
        REFERENCES countries(country_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    release_date DATE,
    cover_url VARCHAR(255),

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1,

    CONSTRAINT fk_album_artist FOREIGN KEY (artist_id)
        REFERENCES artists(artist_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT NOT NULL,
    genre_id INT NULL,
    title VARCHAR(150) NOT NULL,
    duration_seconds INT NOT NULL, 

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1,

    CONSTRAINT fk_song_album FOREIGN KEY (album_id)
        REFERENCES albums(album_id),
    CONSTRAINT fk_song_genre FOREIGN KEY (genre_id)
        REFERENCES genres(genre_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE listens (
    listen_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    listen_datetime DATETIME NOT NULL,
    seconds_played INT NOT NULL, 

    created_at DATETIME DEFAULT NOW(),
    created_by VARCHAR(50),
    updated_at DATETIME,
    updated_by VARCHAR(50),
    active TINYINT DEFAULT 1,

    CONSTRAINT fk_listen_user FOREIGN KEY (user_id)
        REFERENCES users(user_id),
    CONSTRAINT fk_listen_song FOREIGN KEY (song_id)
        REFERENCES songs(song_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

