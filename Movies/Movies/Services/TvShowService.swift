//
//  TvShowService.swift
//  Movies
//
//  Created by Facundo Lanùs on 16/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import Foundation

class TvShowService {
    
    let dao = TVShowDAO()
    
    func getPopularTvShow(page: Int, completion: @escaping([TVShow])-> Void) {
        dao.getPopularTvShows(page: page) { (tvShows) in
            completion(tvShows)
        }
    }
    
    func getTvShowRecomendations(page: Int, tvShow: TVShow, completion: @escaping([TVShow]) -> Void) {
        dao.getTvShowRecomendations(page: page, tvShow: tvShow) { (tvShows) in
            completion(tvShows)
        }
    }
    
    func getTvShowWithQuery(query: String, completion: @escaping ([TVShow]) -> Void) {
        dao.getTvShowWithQuery(query: query) { (tvShows) in
            completion(tvShows)
        }
    }
    
    func getTvShowGenres(completion: @escaping([Genre]) -> Void) {
        dao.getTvShowGenres { (genres) in
            completion(genres)
        }
    }
    
    func getTvShowwByGenre(genre: Genre, completion: @escaping ([TVShow]) -> Void) {
        dao.getTvShowwByGenre(genre: genre) { (tvShows) in
            completion(tvShows)
        }
    }
    
    func getYoutubeUrl (tvShow: TVShow, completion: @escaping (URL) -> Void) {
        dao.getYoutubeUrl(tvShow: tvShow) { (url) in
            completion(url)
        }
    }

}
