//
//  ContentView.swift
//  ReadMe
//
//  Created by greenthings on 2021/11/10.
//

import SwiftUI

struct ContentView: View {
    @State var library: Library = Library()
    
    
    var body: some View {
        NavigationView {
            List(library.sortedBooks) { book in
                BookRow(book: book, image: $library.images[book])
            }
            .navigationTitle("My Library")
        }
    }
}



struct BookRow: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book, image: $image)){
        HStack {
            Book.Image(image: image, title: book.title,size: 80, cornerRadius: 12)
            VStack(alignment: .leading) {
                TitleAndAuthorStack(book: book,titleFont: .title2,authorFont: .title3)
                if !book.microReview.isEmpty{
                    Spacer()
                    TextField("", text: $book.microReview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical)
    }
}
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewedInAllColorSchemes
    }
}



