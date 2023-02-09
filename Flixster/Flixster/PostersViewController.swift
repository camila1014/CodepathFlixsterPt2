//
//  PosterGridViewController.swift
//  Flixster
//
//  Created by Camila Aichele on 2/6/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController {
    
    var posters: [Posters] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a611329331a498aa616c63536723f9d1")!
        
        //a611329331a498aa616c63536723f9d1
        //https://api.themoviedb.org/3/movie/now_playing?api_key=a611329331a498aa616c63536723f9d1
        
        
        // Use the URL to instantiate a request
        let request = URLRequest(url: url)
        
        // Create a URLSession using a shared instance and call its dataTask method
        // The data task method attempts to retrieve the contents of a URL based on the specified URL.
        // When finished, it calls it's completion handler (closure) passing in optional values for data (the data we want to fetch), response (info about the response like status code) and error (if the request was unsuccessful)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }
            
            // Make sure we have data
            guard data != nil else {
                print("❌ Data is nil")
                return
            }
            
            // The `JSONSerialization.jsonObject(with: data)` method is a "throwing" function (meaning it can throw an error) so we wrap it in a `do` `catch`
            // We cast the resultant returned object to a dictionary with a `String` key, `Any` value pair.
            
                // Create a JSON Decoder
                let decoder = JSONDecoder()
                do {
                    // Try to parse the response into our custom model
                    let response = try decoder.decode(PostersSearchResponse.self, from: data!)
                    let posters = response.results
                    self?.posters = posters
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            task.resume()
            // Do any additional setup after loading the view.
            /*
            collectionView.dataSource = self
            
            // Get a reference to the collection view's layout
            // We want to dynamically size the cells for the available space and desired number of columns.
            // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            
            // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
            // Set this to taste.
            layout.minimumInteritemSpacing = 4
            
            // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
            // Set this to taste.
            layout.minimumLineSpacing = 4
            
            // Set this to however many columns you want to show in the collection.
            let numberOfColumns: CGFloat = 3
            
            // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
            let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
            
            // Set the size that each tem/cell should display at
            layout.itemSize = CGSize(width: width, height: width)
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return movies.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterGridCell", for: indexPath) as! PosterGridCell
            
            // Use the indexPath.item to index into the albums array to get the corresponding album
            let movie = movies[indexPath.item]
            
            // Get the artwork image url
            let imageUrl = Movie.posterBaseURLString + movie.posterPath
            
            // Set the image on the image view of the cell
            Nuke.loadImage(with: URL(string: imageUrl)!, into: cell.posterView)
            
            return cell
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // TODO: Pt 1 - Pass the selected track to the detail view controller
            
            // Get the cell that triggered the segue
            if let cell = sender as? UICollectionViewCell,
               // Get the index path of the cell from the table view
               let indexPath = collectionView.indexPath(for: cell),
               // Get the detail view controller
               let movieDetailsViewController = segue.destination as? MovieDetailsViewController {
                
                // Use the index path to get the associated track
                let movie = movies[indexPath.row]
                
                // Set the track on the detail view controller
                movieDetailsViewController.movie = movie
            }
        }
        */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
