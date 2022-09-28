//
//  ActorListScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/11/21.
//

import SwiftUI

struct ActorListScreen: View {
    
    let movie: MovieViewModel
    
    @StateObject private var actorListVM = ActorListViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
           
            List {
            
                Section(header: Text("Actors")) {
                    ForEach(actorListVM.actors, id: \.actorId) { actor in
                        
                        HStack {
                            NavigationLink(
                                destination: ActorDetailsScreen(actor: actor),
                                label: {
                                    Text(actor.name)
                                        .foregroundColor(.black)
                                })
                            Spacer()
                        }
                        .padding(10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9567790627, green: 0.9569163918, blue: 0.9567491412, alpha: 1)), Color(#colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1))]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    }
                }
            
            }.listStyle(PlainListStyle())
            
        
        .onAppear(perform: {
            actorListVM.getActorsBtMovie(vm: movie)
        })
        .sheet(isPresented: $isPresented, onDismiss: {
                actorListVM.getActorsBtMovie(vm: movie)
        }, content: {
            AddActorScreen(movie: movie)
        })
        .navigationTitle("Movie Title")
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))

    }
}

struct ActorListScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let movie = Movie(context: CoreDataManager.shared.viewContext)
        movie.title = "Title of Movie for Preview"
        
        let actor = Actor(context: CoreDataManager.shared.viewContext)
        actor.name = "Preview Actor"
        
        movie.addToActors(actor)
        return ActorListScreen(movie: MovieViewModel(movie: movie))
            .embedInNavigationView()
    }
}
