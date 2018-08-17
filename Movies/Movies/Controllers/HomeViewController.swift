//
//  HomeViewController.swift
//  Movies
//
//  Created by Facundo Lanùs on 14/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import UIKit
import ScrollableSegmentedControl

let movieTitle: String = "Movies"
let tvShowsTitle: String = "TvShows"
let cellMovieId: String = "CellForMovieVC"
let cellShowId: String = "CellForShowVC"
let scrollableSegmentedItemsMovie: [String] = ["Popular", "Genres"]

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let segmentedItems: [String] = [movieTitle, tvShowsTitle]
    
    var popularMovies: [Movie] = []
    var moviesGenres: [Movie] = []
    var moviesByGenre: [Movie] = []
    
    var popularTvShows: [TVShow] = []
    
    lazy var mediaTable: UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .darkGray
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = self
        tv.delegate = self
        tv.rowHeight = 150
        
        return tv
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: segmentedItems)
        sc.selectedSegmentIndex = 0
        sc.backgroundColor = .gray
        sc.tintColor = .white
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(action), for: .valueChanged)
        
        return sc
    }()
    
    @objc func action() {
        mediaTable.reloadData()
    }
    
    lazy var scrollableSegmentedControll: ScrollableSegmentedControl = {
        let sc = ScrollableSegmentedControl()
        sc.backgroundColor = .gray
        sc.tintColor = .white
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.segmentStyle = .textOnly
        sc.addTarget(self, action: #selector(setScrollableCollectionViewTitle), for: .touchUpInside)
        
        sc.underlineSelected = true
        sc.segmentContentColor = UIColor.white
        sc.selectedSegmentContentColor = UIColor.yellow
        sc.backgroundColor = UIColor.black
        
        
        return sc
    }()
    
    var moviesDic: [String: [[String: [Movie]]]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies()

        
        getTvShows()
        
        setCollectionViewTitle()
        setScrollableCollectionViewTitle()
        scrollableSegmentedControll.selectedSegmentIndex = 0
        
        view.backgroundColor = .darkGray
        
        view.addSubview(segmentedControl)
        segmentedControlConstraints()
        
        view.addSubview(scrollableSegmentedControll)
        view.addSubview(mediaTable)
        scrollableSegmentedControllSetConstraints()
        mediaTableConstraint()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setCollectionViewTitle() {
        for i in 0 ..< segmentedItems.count {
            segmentedControl.setTitle(segmentedItems[i], forSegmentAt: i)
        }
    }
    
    @objc private func setScrollableCollectionViewTitle() {
        if segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) == movieTitle {
            for i in  0 ..< scrollableSegmentedItemsMovie.count {
                scrollableSegmentedControll.insertSegment(withTitle: scrollableSegmentedItemsMovie[i], at: i)
            }
        }
    }

    
    private func scrollableSegmentedControllSetConstraints() {
        scrollableSegmentedControll.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 10).isActive = true
        scrollableSegmentedControll.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        scrollableSegmentedControll.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        scrollableSegmentedControll.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func segmentedControlConstraints() {
        segmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 7).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 7).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -7).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func mediaTableConstraint() {
        mediaTable.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        mediaTable.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        mediaTable.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        mediaTable.topAnchor.constraint(equalTo: scrollableSegmentedControll.bottomAnchor, constant: 10).isActive = true
    }
    
    private func getMovies() {
        let movieService = MovieService()
        
        movieService.getPopularMovies(page: 1) { (theMovies) in
            
            for aMovie in theMovies {
                movieService.getMovieCast(movie: aMovie, completion: { (actors) in
                    aMovie.cast = actors
                    self.popularMovies.append(aMovie)
                })
            }
            
//            self.popularMovies = theMovies
            
            self.mediaTable.reloadData()
        }
        
        
    }
    
    private func getTvShows() {
        let tvShowService = TvShowService()
        
        
        tvShowService.getPopularTvShow(page: 1) { (tvShows) in
            self.popularTvShows = tvShows
            self.mediaTable.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // TABLE
    func numberOfSections(in tableView: UITableView) -> Int {
        var num: Int = 0
        
        if segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) == movieTitle {
            mediaTable.register(HomeMovieTableViewCell.self, forCellReuseIdentifier: cellMovieId)
            num = popularMovies.count
        }
        if segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) == tvShowsTitle {
            mediaTable.register(HomeTvShowTableViewCell.self, forCellReuseIdentifier: cellShowId)
            num = popularTvShows.count
        }
        
        return num
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) == movieTitle {
            cell = tableView.dequeueReusableCell(withIdentifier: cellMovieId, for: indexPath)
        }
        if segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) == tvShowsTitle {
            cell = tableView.dequeueReusableCell(withIdentifier: cellShowId, for: indexPath)
        }
        
        if let theCell = cell as? HomeMovieTableViewCell {
            theCell.setupCell(movie: popularMovies[indexPath.section])
        }
        
        if let theCell = cell as? HomeTvShowTableViewCell {
            theCell.setupCell(show: popularTvShows[indexPath.section])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var header: String = ""
        
        if segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) == movieTitle {
            header = popularMovies[section].title
        }
        if segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex) == tvShowsTitle {
            header = popularTvShows[section].name
        }

        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: UIView = {
            let view = UIView()
            view.backgroundColor = .darkGray
            view.translatesAutoresizingMaskIntoConstraints = false
            
            view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            view.heightAnchor.constraint(equalToConstant: 10).isActive = true
            
            
            
            return view
        }()
        
        return footerView
    }
    
}
