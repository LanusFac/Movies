//
//  TvShowDao.swift
//  Movies
//
//  Created by Facundo Lanùs on 16/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import Foundation
import Alamofire

class TVShowDAO {
    
    let apiKey: String = "db898f2be5d80aee6fee0407b549ec39"
    
    func getPopularTvShows(page: Int, completion: @escaping([TVShow]) -> Void) {
        let popularTvShowUrl = "https://api.themoviedb.org/3/tv/popular?api_key=\(apiKey)&language=en-US&page=\(page)"
        Alamofire.request(popularTvShowUrl).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var tvShowArray: [TVShow] = []
                    for aDictionary in results {
                        let newShow = TVShow.init(dictionary: aDictionary)
                        tvShowArray.append(newShow)
                    }
                    completion(tvShowArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    func getTvShowRecomendations(page: Int, tvShow: TVShow, completion: @escaping([TVShow]) -> Void) {
        let id = tvShow.id
        let recomendationcTvShowUrl = "https://api.themoviedb.org/3/tv/\(id)/recommendations?api_key=\(apiKey)&language=en-US&page=\(page)"
        Alamofire.request(recomendationcTvShowUrl).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var tvShowArray: [TVShow] = []
                    for aDictionary in results {
                        let newShow = TVShow.init(dictionary: aDictionary)
                        tvShowArray.append(newShow)
                    }
                    completion(tvShowArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    func getTvShowWithQuery(query: String, completion: @escaping ([TVShow]) -> Void) {
        let searchTvShow = "https://api.themoviedb.org/3/tv/tv?api_key=\(apiKey)&language=en-US&query=\(query)&page=1"
        Alamofire.request(searchTvShow).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var resultsArray: [TVShow] = []
                    for aDictionary in results {
                        let newTvShow = TVShow.init(dictionary: aDictionary)
                        resultsArray.append(newTvShow)
                    }
                    completion(resultsArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    func getTvShowGenres(completion: @escaping([Genre]) -> Void) {
        let genresUrl = "https://api.themoviedb.org/3/genre/tv/list?api_key=\(apiKey)&language=en-US"
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
    
    func getTvShowwByGenre(genre: Genre, completion: @escaping ([TVShow]) -> Void) {
        let serchTvShowByGenreUrl = "https://api.themoviedb.org/3/discover/tv?api_key=\(apiKey)&with_genres=\(genre.id)"
        Alamofire.request(serchTvShowByGenreUrl).responseJSON { (response) in
            if let mainDictionary = response.result.value as? [String: AnyObject] {
                if let results = mainDictionary["results"] as? [[String: AnyObject]] {
                    var TvShowByGenreArray: [TVShow] = []
                    for aDictionary in results {
                        let newTvShow = TVShow.init(dictionary: aDictionary)
                        TvShowByGenreArray.append(newTvShow)
                    }
                    completion(TvShowByGenreArray)
                }
                else {
                    completion([])
                }
            }
        }
    }
    
    // Esta funcion hay que mejorarla para que devuelva el mejor formato de video
    func getYoutubeUrl (tvShow: TVShow, completion: @escaping (URL) -> Void) {
        let tvShowId = tvShow.id
        let youTubeLink = "https://www.youtube.com/watch?v="
        let videoData = "https://api.themoviedb.org/3/tv/\(tvShowId)/videos?api_key=\(apiKey)&language=en-US&page=1"
        
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
    
}
