//
//  MovieDetailViewController.swift
//  modul_19.7
//
//  Created by Admin on 27/05/24.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: Movie?
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let originalTitleLabel = UILabel()
    let descriptionLabel = UILabel()
    let ratingsLabel = UILabel()
    let yearLabel = UILabel()
    let durationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configure()
    }
    
    func setupViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        originalTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingsLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(originalTitleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(ratingsLabel)
        view.addSubview(yearLabel)
        view.addSubview(durationLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            originalTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            originalTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            originalTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: originalTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            ratingsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            ratingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ratingsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            yearLabel.topAnchor.constraint(equalTo: ratingsLabel.bottomAnchor, constant: 10),
            yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            durationLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 10),
            durationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            durationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    func configure() {
        guard let movie = movie else { return }
        
        titleLabel.text = movie.nameRu
        descriptionLabel.text = "Описание"
        // other configurations like fetching image, ratings, year, etc.
    }
}
