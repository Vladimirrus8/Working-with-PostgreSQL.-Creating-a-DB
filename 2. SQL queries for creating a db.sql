CREATE TABLE Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT CHECK (release_year >= 1900)
);

CREATE TABLE Artists_Albums (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES Albums(id) ON DELETE CASCADE
);

CREATE TABLE Tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    duration INT CHECK (duration > 0),
    FOREIGN KEY (album_id) REFERENCES Albums(id) ON DELETE CASCADE
);

CREATE TABLE Compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT CHECK (release_year >= 1900)
);

CREATE TABLE Compilation_Tracks (
    compilation_id INT NOT NULL,
    track_id INT NOT NULL,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES Compilations(id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES Tracks(id) ON DELETE CASCADE
);

-- Таблица для связи между жанрами и исполнителями
CREATE TABLE Artists_Genres (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(id) ON DELETE CASCADE
);
