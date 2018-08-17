//
//  MovieService.swift
//  Movies
//
//  Created by Facundo Lanùs on 15/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import Foundation

class MovieService {
    
    let dao = MovieDao()
    
    func getPopularMovies(page: Int, completion: @escaping ([Movie]) -> Void) {
        dao.getPopularMovies(page: page) { (movies) in
            completion(movies)
        }
    }
    
    func getMoviesRecomendations(page: Int, movie: Movie, completion: @escaping([Movie]) -> Void) {
        dao.getMoviesRecomendations(page: page, movie: movie) { (movies) in
            completion(movies)
        }
    }
    
    func getMoviesWithQuery(query: String, completion: @escaping ([Movie]) -> Void) {
        dao.getMoviesWithQuery(query: query) { (movies) in
            completion(movies)
        }
    }
    
    func getMovieGenres(completion: @escaping([Genre]) -> Void) {
        dao.getMovieGenres { (genres) in
            completion(genres)
        }
    }
    
    func getMoviewByGenre(genre: Genre, completion: @escaping ([Movie]) -> Void) {
        dao.getMoviewByGenre(genre: genre) { (movies) in
            completion(movies)
        }
    }
    
    func getYoutubeUrl (movie: Movie, completion: @escaping (URL) -> Void) {
        dao.getYoutubeUrl(movie: movie) { (link) in
            completion(link)
        }
    }
    
    func getMovieCast (movie: Movie, completion: @escaping ([Actor]) -> Void) {
        dao.getMovieCast(movie: movie) { (movies) in
            completion(movies)
        }
    }
}
