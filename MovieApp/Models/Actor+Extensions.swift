//
//  Actor+Extensions.swift
//  MovieApp
//
//  Created by Chris Hand on 9/25/22.
//

import Foundation
import CoreData

extension Actor: BaseModel {
    
    static func getActorsByMovieId(movieId: NSManagedObjectID) -> [Actor] {
        guard let movie = Movie.byId(id: movieId) as? Movie,
              let actors = movie.actors
        else {
            return []
        }
        
        return (actors.allObjects as? [Actor]) ?? []
    }
}
