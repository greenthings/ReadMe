//
//  Book views.swift
//  ReadMe
//
//  Created by greenthings on 2021/11/10.
//
// It will be a collection of reusable views for books
import SwiftUI



struct TitleAndAuthorStack: View {
    let book: Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack(alignment: .leading){
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
                .foregroundColor(.secondary)
        }
        .lineLimit(1)
    }
}



extension Book{

    struct Image: View {
        let title: String
        var size: CGFloat?
        
        var body: some View {
            let symbol = SwiftUI.Image(titile: title) ??
                .init(systemName: "book")
                
                symbol
                .resizable()
                // as possible as fit in frame
                .scaledToFit()
                // set a frame
                .frame(width:size, height:size)
                // image like text
                .foregroundColor(.secondary.opacity(0.5))
        }
    }
    
}

extension Image{

    init?(titile:String) {
        guard let character = titile.first,
        case let symbolName = "\(character.lowercased()).square", UIImage(systemName: symbolName) != nil
        else{
            return nil
        }
        self.init(systemName: symbolName)
    }
}


struct Book_Previews: PreviewProvider{
    static var previews: some View{
        VStack{
            TitleAndAuthorStack(book: .init(), titleFont:.title , authorFont: .title2)
        Book.Image(title: Book().title)
        Book.Image(title: "")
        Book.Image(title: "📖")
        }
    }
}
