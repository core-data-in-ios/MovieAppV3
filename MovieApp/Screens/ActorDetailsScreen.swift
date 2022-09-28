//
//  ActorDetailsScreen.swift
//  MovieApp
//
//  Created by Chris Hand on 9/27/22.
//

import SwiftUI

struct ActorDetailsScreen: View {
    let actor: ActorViewModel
    
    var body: some View {
        VStack {
            List(actor.movies, id: \.movieId) { movie in
                MovieCell(movie: movie)
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct ActorDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        let actorVM = ActorViewModel(actor: Actor(context: Actor.viewContext))
        ActorDetailsScreen(actor: actorVM)
    }
}
