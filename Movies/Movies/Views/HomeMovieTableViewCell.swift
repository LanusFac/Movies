//
//  HomeTableViewCell.swift
//  Movies
//
//  Created by Facundo Lanùs on 14/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//

import UIKit
import Kingfisher

class HomeMovieTableViewCell: UITableViewCell {

    lazy var posterImage: UIImageView = {
        let poster = UIImageView()
        poster.translatesAutoresizingMaskIntoConstraints = false
        
        return poster
    }()
    
    lazy var directorTextView: UITextView = {
        let title = UITextView()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = .red
        
        return title
    }()
    
    lazy var castTextView: UITextView = {
        let cast = UITextView()
        cast.translatesAutoresizingMaskIntoConstraints = false
        cast.backgroundColor = .green
        
        return cast
    }()
    
//    lazy var overviewTextView: UITextView = {
//        let overview = UITextView()
//        overview.translatesAutoresizingMaskIntoConstraints = false
//        overview.backgroundColor = .darkGray
//        overview.textColor = .white
//        overview.textAlignment = .center
//        overview.font = UIFont(name: "Copperplate-Light", size: 15)
//        overview.isEditable = false
//
//        return overview
//    }()
    
    lazy var voteAvarangeTextView: UITextView = {
        let va = UITextView()
        va.translatesAutoresizingMaskIntoConstraints = false
        va.backgroundColor = .darkGray
        va.textColor = .white
        va.textAlignment = .center
        va.font = UIFont(name: "Copperplate-Bold", size: 25)
        va.isEditable = false

        return va
    }()
    
    lazy var genresTextView: UITextView = {
        let va = UITextView()
        va.translatesAutoresizingMaskIntoConstraints = false
        va.backgroundColor = .darkGray
        va.textColor = .white
        va.textAlignment = .center
        va.font = UIFont(name: "Copperplate-Light", size: 15)
        va.isEditable = false
        
        return va
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .darkGray
        
        contentView.addSubview(posterImage)
        setPosterConstraints()
        
        contentView.addSubview(directorTextView)
        setDirectorTextViewConstraints()
        
        contentView.addSubview(castTextView)
        setCastTextViewConstraints()
        
        contentView.addSubview(voteAvarangeTextView)
        setVoteAvarangeTextViewConstraints()
        
        contentView.addSubview(genresTextView)
        setGenreTextViewConstraints()
    }

    private func setPosterConstraints() {
        posterImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        posterImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        posterImage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        posterImage.widthAnchor.constraint(equalTo: self.posterImage.heightAnchor, multiplier: 8.5/11).isActive = true
    }
    
    private func setDirectorTextViewConstraints() {
        directorTextView.leadingAnchor.constraint(equalTo: self.posterImage.trailingAnchor, constant: 5).isActive = true
        directorTextView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        directorTextView.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        directorTextView.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    private func setCastTextViewConstraints() {
        castTextView.leadingAnchor.constraint(equalTo: self.posterImage.trailingAnchor, constant: 5).isActive = true
        castTextView.topAnchor.constraint(equalTo: self.directorTextView.bottomAnchor, constant: 5).isActive = true
        castTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        castTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setVoteAvarangeTextViewConstraints() {
        voteAvarangeTextView.topAnchor.constraint(equalTo: self.castTextView.bottomAnchor).isActive = true
        voteAvarangeTextView.leadingAnchor.constraint(equalTo: self.posterImage.trailingAnchor).isActive = true
        voteAvarangeTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        voteAvarangeTextView.widthAnchor.constraint(equalTo: self.voteAvarangeTextView.heightAnchor).isActive = true
    }
    
    private func setGenreTextViewConstraints() {
        genresTextView.topAnchor.constraint(equalTo: self.castTextView.bottomAnchor).isActive = true
        genresTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        genresTextView.leadingAnchor.constraint(equalTo: self.voteAvarangeTextView.trailingAnchor).isActive = true
        genresTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setupCell(movie: Movie) {
        let urlPosterString = "https://image.tmdb.org/t/p/w185/" + movie.posterPath
        let urlPosterImg = URL(string: urlPosterString)
        posterImage.kf.setImage(with: urlPosterImg)

        
        voteAvarangeTextView.text = "\(movie.voteAvarage)"
        
    }
    
}


