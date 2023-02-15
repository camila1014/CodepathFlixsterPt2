//
//  PostersViewController.swift
//  FlixsterPt2
//
//  Created by Camila Aichele on 2/9/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        let poster = posters[indexPath.item]
        
        let imageUrl =  URL(string: "https://image.tmdb.org/t/p/w185" + poster.poster_path)!
        
        // Set the image on the image view of the cell
        Nuke.loadImage(with: imageUrl, into: cell.posterImageView)
        return cell
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var posters: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
                    
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=627284996079c07d5b79b52fec63afc4")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(MoviesResponse.self, from: data)
                
                let posters = response.results
                
                print(posters)
                
                // Make the table view reload now that we have new data
                DispatchQueue.main.async {
                    self?.posters = posters
                    self?.collectionView.reloadData()
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        
        // Initiate the network request
        task.resume()
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumInteritemSpacing = 4
        
        layout.minimumLineSpacing = 4
        
        let numberOfColumns: CGFloat = 3
        
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        
        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
            if let cell = sender as? UICollectionViewCell,
               let indexPath = collectionView.indexPath(for: cell),
               let detailViewController = segue.destination as? DetailViewController {
               let movie = posters[indexPath.row]
                
                detailViewController.movie = movie

                }
            
               

        }
    
}




