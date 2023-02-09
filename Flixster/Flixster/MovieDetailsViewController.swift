//
//  MovieDetailsViewController.swift
//  Flixster
//
//  Created by Camila Aichele on 1/31/23.
//

import UIKit
import Nuke
class MovieDetailsViewController: UIViewController {

    var movie: Movie!
    
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieVoteCount: UILabel!
    @IBOutlet weak var movieVoteAverage: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark

        // Do any additional setup after loading the view.
        if let movie = movie {
            Nuke.loadImage(with: URL(string: Movie.backdropBaseURLString + movie.backdropPath)!, into: movieImage)
            
            movieTitle.text = movie.originalTitle
            
            //movieVoteAverage.text =
            movieVoteAverage.attributedText = NSAttributedString(string: "\(movie.voteAverage) Vote Average", attributes:
                [.underlineStyle: NSUnderlineStyle.thick.rawValue])
            
            //movieVoteCount.text = "\(movie.voteCount) Vote Count"
            movieVoteCount.attributedText = NSAttributedString(string: "\(movie.voteCount) Vote Count", attributes:
                [.underlineStyle: NSUnderlineStyle.thick.rawValue])
            
            moviePopularity.text = "\(movie.popularity) Popularity"
            
            movieOverview.text = movie.overview
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
