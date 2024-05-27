//
//  MovieTableViewCell.swift
//  modul_19.7
//
//  Created by Admin on 24/05/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieCell"

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var reuseIdentifier: String? {
//        return "MovieCell"
//    }

    let filmId = UILabel()
    let nameRu = UILabel()
    let posterUrl = UIImageView()
    
    func setupViews() {
        nameRu.translatesAutoresizingMaskIntoConstraints = false
        posterUrl.translatesAutoresizingMaskIntoConstraints = false
        posterUrl.contentMode = .scaleAspectFit
        
        contentView.addSubview(nameRu)
        contentView.addSubview(posterUrl)
        self.addSubview(nameRu)
        self.addSubview(posterUrl)
        
        NSLayoutConstraint.activate([
            posterUrl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            posterUrl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterUrl.widthAnchor.constraint(equalToConstant: 50),
            posterUrl.heightAnchor.constraint(equalToConstant: 75),
            
            nameRu.leadingAnchor.constraint(equalTo: posterUrl.trailingAnchor, constant: 10),
            nameRu.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameRu.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    

    
    
    func configure(with movie: Movie) {
        filmId.text = movie.nameRu
        
        if let url = URL(string: movie.posterUrl) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self.posterUrl.image = UIImage(data: data)
                    }
                }
            }
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: url) {
//                    DispatchQueue.main.async {
//                        self.posterUrl.image = UIImage(data: data)
//                    }
//                }
//            }
        }
    }

}
