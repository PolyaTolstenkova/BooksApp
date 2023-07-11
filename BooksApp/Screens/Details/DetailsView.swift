//
//  DetailsView.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 07.07.2023.
//

import SwiftUI

struct DetailsView: View {
    @State private var showActionSheet: Bool = false
    @State private var isWebViewPresented: Bool = false
    @State private var selectedURL: String = String()
    let book: Book
    
    var body: some View {
        HStack {
            VStack {
                ImageView(imageURL: book.imageURL, height: 200)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.system(size: 20))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 0.8)
                
                BookTextView(
                    text: "\("book_by".localized) \(book.author)",
                    color: .bookText,
                    size: 16
                )
                BookTextView(
                    text: "\("book_rank".localized) \(book.rank)",
                    color: .bookGrayText,
                    size: 14
                )
                BookTextView(
                    text: "\("book_publisher".localized) \(book.publisher)",
                    color: .bookGrayText,
                    size: 14
                )
                
                buyBookButton
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, maxHeight: 230, alignment: .leading)
        .padding(5)
        
        DividerView()
        
        if !book.overview.isEmpty {
            VStack {
                Text("details_description".localized)
                    .font(.system(size: 20))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 1)
                
                Text(book.overview)
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 10)
        }
        Spacer()
    }
}

private extension DetailsView {
    var buyBookButton: some View {
        Button(action: {
            showActionSheet = true
        }) {
            Text("details_buy_button".localized)
                .foregroundColor(.buttonText)
                .bold()
                .padding()
        }
        .frame(width: 200, height: 40)
        .background(Color.buttonBackground)
        .cornerRadius(10)
        .padding()
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("details_action_sheet_title".localized),
                buttons: getBuyLinkButtons()
            )
        }
        .sheet(isPresented: $isWebViewPresented, content: {
            VStack {
                WebView(urlString: selectedURL)
                Button(action: {
                    isWebViewPresented = false
                }) {
                    Text("details_close_button".localized)
                        .font(.system(size: 20))
                        .foregroundColor(.bookText)
                        .bold()
                }
            }
        })
    }
    
    func getBuyLinkButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = []
        
        for buyLink in book.buyLinks {
            let button = ActionSheet.Button.default(Text(buyLink.name)) {
                selectedURL = buyLink.url
                isWebViewPresented = true
            }
            buttons.append(button)
        }
        
        let cancelButton = ActionSheet.Button.cancel()
        buttons.append(cancelButton)
        
        return buttons
    }
}



struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(book: Book(title: "", author: "", image: "", overview: "", publisher: "", rank: 0, buyLinks: []))
    }
}
