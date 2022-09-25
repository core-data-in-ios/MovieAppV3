//
//  AddActorViewModel.swift
//  MovieApp
//
//  Created by Chris Hand on 9/25/22.
//

import Foundation
import CoreData

class AddActorViewModel: ObservableObject {
    var name: String = ""
    
    func AddActorToMovie(movieId: NSManagedObjectID) {
        let movie: Movie? = Movie.byId(id: movieId)
        
        if let movie = movie {
            let actor = Actor(context: Actor.viewContext)
            actor.name = name
            actor.addToMovies(movie)
            try? actor.save()
        }
    }
}
