//
//  MovieCell.swift
//  Flixster
//
//  Created by Camila Aichele on 1/31/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        movieTitle.text = movie.originalTitle
        movieOverview.text = movie.overview
        
        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.posterPath)!, into: posterImageView)
    }
    

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
}
