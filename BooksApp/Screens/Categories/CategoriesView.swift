//
//  CategoriesView.swift
//  BooksApp
//
//  Created by Polina Tolstenkova on 05.07.2023.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var viewModel: CategoriesViewModel
    private let screenHeight = UIScreen.main.bounds.size.height
    private let colors: [Color] = [
        Color.categoryBackground1,
        Color.categoryBackground2,
        Color.categoryBackground3,
        Color.categoryBackground4
    ]
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            content
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.categories.isEmpty {
            VStack {
                Image.noDataFound
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                Text("categories_no_data".localized)
                    .font(.system(size: 30))
                    .foregroundColor(.bookGrayText)
            }
        } else {
            NavigationView {
                ScrollView {
                    ForEach(viewModel.categories, id: \.id) { category in
                        NavigationLink {
                            BooksView(viewModel: BooksViewModel(category: category))
                        } label: {
                            CategoryView(
                                name: category.name,
                                publishedDate: viewModel.publishedDate.convertDateFormat(),
                                backgroundColor: colors[viewModel.getIndex(of: category) % colors.count]
                            )
                        }
                    }
                }
                .alert(isPresented: $viewModel.showErrorAlert) {
                    Alert(
                        title: Text(
                            viewModel.error?.localizedDescription ?? "unexpected_error".localized
                        ),
                        dismissButton: .default(
                            Text("categories_alert_button".localized)
                        )
                    )
                }
                .navigationTitle("categories_title".localized)
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(viewModel: CategoriesViewModel(dataManager: MockDataManager()))
    }
}
