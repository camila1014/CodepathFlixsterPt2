//
//  Movies.swift
//  FlixsterPt2
//
//  Created by Camila Aichele on 2/9/23.
//

import Foundation

struct MoviesResponse: Decodable {
    var results: [Movie]
    
    static func loadJson() -> [Movie] {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesResponse.self, from: data)
                return jsonData.results
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}

struct Movie: Decodable {
    var original_title: String
    var overview: String
    
    var poster_path: String// when loading image with Nuke, make sure you convert to url by prepending base url
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"

    var vote_average: Double
    var vote_count: Int
    var popularity: Double
    
  //  var back_drop_path: URL
    
}

/*
extension Movie {

    /// An array of mock tracks
    static var mockMovies: [Movie]  = [
        Movie(original_title: "Puss in Boots", overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.", poster_path: URL(string:"https://image.tmdb.org/t/p/w185/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")!, vote_average: 8.6, vote_count:2900, popularity: 7675.741, back_drop_path: URL(string: "https://image.tmdb.org/t/p/w185/faXT8V80JRhnArTAeYXz0Eutpv9.jpg")!),
        Movie(original_title: "M3GAN", overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.", poster_path:  URL(string:"https://image.tmdb.org/t/p/w185/d9nBoowhjiiYc4FBNtQkPY7c11H.jpg")!, vote_average: 7.6, vote_count: 978, popularity: 6177.288,back_drop_path: URL(string: "https://image.tmdb.org/t/p/w185/otOtC45BDzFW7nuxnWHMmnYsicK.jpg")!),
        Movie(original_title: "Avatar: The Way of Water", overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.", poster_path: URL(string:"https://image.tmdb.org/t/p/w185/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")!, vote_average: 7.7, vote_count: 4808, popularity: 3023.832,back_drop_path: URL(string: "https://image.tmdb.org/t/p/w185/evaFLqtswezLosllRZtJNMiO1UR.jpg")!),
        Movie(original_title: "Devotion", overview: "The harrowing true story of two elite US Navy fighter pilots during the Korean War. Their heroic sacrifices would ultimately make them the Navy's most celebrated wingmen.", poster_path: URL(string: "https://image.tmdb.org/t/p/w185/26yQPXymbWeCLKwcmyL8dRjAzth.jpg")!, vote_average: 7.6, vote_count: 178, popularity: 2256.342, back_drop_path: URL(string: "https://image.tmdb.org/t/p/w185/5pMy5LF2JAleBNBtuzizfCMWM7k.jpg")!),
        Movie(original_title: "The Enforcer", overview: "A noir thriller set in Miami, the film follows an enforcer who discovers his femme fatale boss has branched out into cyber sex trafficking, putting a young runaway he’s befriended at risk. He sacrifices everything to save the young girl from the deadly organization he’s spent his life building.", poster_path: URL(string: "https://image.tmdb.org/t/p/w185/72V1r1G8S87ELagVxjqAUdChMCt.jpg")!, vote_average: 7.3, vote_count: 117, popularity: 1830.972,back_drop_path: URL(string: "https://image.tmdb.org/t/p/w185/Aqldsq65Nj1KAkQD2MzkZsAk5N5.jpg")!)
    ]
 
 

    // We can now access this array of mock movies anywhere like this:
    // let movies = Movies.mockMovies
}
*/

