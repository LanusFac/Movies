//
//  MovieDao.swift
//  Movies
//
//  Created by Facundo Lanùs on 15/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//


import Foundation
import Alamofire

class MovieDao {
    
    let apiKey: String = "db898f2be5d80aee6fee0407b549ec39"
    
    func getPopularMovies(page: Int, completion: @escaping([Movie]) -> Void) {
        let popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=\(page)"
        Alamofire.request(popularMoviesUrl).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var moviesArray: [Movie] = []
                    for aDictionary in results {
                        let newMoview = Movie.init(dictionary: aDictionary)
                        moviesArray.append(newMoview)
                    }
                    completion(moviesArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    func getMoviesRecomendations(page: Int, movie: Movie, completion: @escaping([Movie]) -> Void) {
        let id = movie.id
        let recomendationMoviesUrl = "https://api.themoviedb.org/3/movie/\(id)/recommendations?api_key=\(apiKey)&language=en-US&page=\(page)"
        Alamofire.request(recomendationMoviesUrl).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: Any] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var moviesRecomendationArray: [Movie] = []
                    for aDictionary in results {
                        let newMovie = Movie.init(dictionary: aDictionary)
                        moviesRecomendationArray.append(newMovie)
                    }
                    completion(moviesRecomendationArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    func getMoviesWithQuery(query: String, completion: @escaping ([Movie]) -> Void) {
        let searchMovie = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&language=en-US&query=\(query)&page=1"
        Alamofire.request(searchMovie).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var resultsMoviesArray: [Movie] = []
                    for aDictionary in results {
                        let newMoview = Movie.init(dictionary: aDictionary)
                        resultsMoviesArray.append(newMoview)
                    }
                    completion(resultsMoviesArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    
    func getMovieGenres(completion: @escaping([Genre]) -> Void) {
        let genresUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US"
        Alamofire.request(genresUrl).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var genresArray: [Genre] = []
                    for aDictionary in results {
                        let newGenre = Genre.init(dictionary: aDictionary)
                        genresArray.append(newGenre)
                    }
                    completion(genresArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    func getMoviewByGenre(genre: Genre, completion: @escaping ([Movie]) -> Void) {
        let serchMovieByGenreUrl = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&with_genres=\(genre.id)"
        Alamofire.request(serchMovieByGenreUrl).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var moviesByGenreArray: [Movie] = []
                    for aDictionary in results {
                        let newMovie = Movie.init(dictionary: aDictionary)
                        moviesByGenreArray.append(newMovie)
                    }
                    completion(moviesByGenreArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    // Esta funcion hay que mejorarla para que devuelva el mejor formato de video
    func getYoutubeUrl (movie: Movie, completion: @escaping (URL) -> Void) {
        let movieId = movie.id
        let youTubeLink = "https://www.youtube.com/watch?v="
        let videoData = "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=\(apiKey)&language=en-US&page=1"
        
        Alamofire.request(videoData).responseJSON { (response) in
            if let dictionary = response.result.value as? [String: AnyObject] {
                if let results = dictionary["results"] as? [[String: AnyObject]] {
                    if results.isEmpty == false {
                        let dataDictionary = results[0]
                        if let videoKey = dataDictionary["key"] as? String {
                            if let youTubeUrl = URL(string: youTubeLink + videoKey) {
                                completion(youTubeUrl)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getMovieCast (movie: Movie, completion: @escaping([Actor]) -> Void) {
        let movieId = movie.id
        let url = "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(apiKey)"
        
        Alamofire.request(url).responseJSON { (response) in
            if let mainDictinary = response.result.value as? [String: AnyObject] {
                if let results = mainDictinary["results"] as? [[String: AnyObject]] {
                    var movieCast: [Actor] = []
                    
                    for aDictionary in results {
                        let newCast = Actor(dictionary: aDictionary)
                        movieCast.append(newCast)
                    }
                    completion(movieCast)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
}

