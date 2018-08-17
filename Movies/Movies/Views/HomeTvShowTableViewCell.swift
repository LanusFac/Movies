//
//  HomeTvShowTableViewCell.swift
//  Movies
//
//  Created by Facundo Lanùs on 16/8/18.
//  Copyright © 2018 Facundo Lanùs. All rights reserved.
//


import UIKit
import Kingfisher

class HomeTvShowTableViewCell: UITableViewCell {
    
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
    
    lazy var overviewTextView: UITextView = {
        let overview = UITextView()
        overview.translatesAutoresizingMaskIntoConstraints = false
        overview.backgroundColor = .darkGray
        overview.textColor = .white
        overview.textAlignment = .center
        overview.font = UIFont(name: "Copperplate-Light", size: 15)
        overview.isEditable = false
        
        return overview
    }()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(posterImage)
        setPosterConstraints()
        
        contentView.addSubview(directorTextView)
        setDirectorTextViewConstraints()
        
        contentView.addSubview(castTextView)
        setCastTextViewConstraints()
        
        contentView.addSubview(overviewTextView)
        setOverviewTextViewConstraints()
    }
    
    private func setPosterConstraints() {
        posterImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        posterImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        posterImage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        posterImage.widthAnchor.constraint(equalTo: self.posterImage.heightAnchor, multiplier: 8.5/11).isActive = true
    }
    
    private func setDirectorTextViewConstraints() {
        directorTextView.leadingAnchor.constraint(equalTo: self.posterImage.trailingAnchor).isActive = true
        directorTextView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        directorTextView.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        directorTextView.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    private func setCastTextViewConstraints() {
        castTextView.leadingAnchor.constraint(equalTo: self.posterImage.trailingAnchor).isActive = true
        castTextView.topAnchor.constraint(equalTo: self.directorTextView.bottomAnchor).isActive = true
        castTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        castTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setOverviewTextViewConstraints() {
        overviewTextView.topAnchor.constraint(equalTo: self.castTextView.bottomAnchor).isActive = true
        overviewTextView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        overviewTextView.leadingAnchor.constraint(equalTo: self.posterImage.trailingAnchor).isActive = true
        overviewTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
    
    
    
    func setupCell(show: TVShow) {
        let urlPosterString = "https://image.tmdb.org/t/p/w185/" + show.posterPath
        let urlPosterImg = URL(string: urlPosterString)
        posterImage.kf.setImage(with: urlPosterImg)
        
        overviewTextView.text = show.overview
    }
}

