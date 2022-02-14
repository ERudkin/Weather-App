//
//  SearchBarHeaderView.swift
//  Weather-App
//
//  Created by Elliot Joseph on 14/02/2022.
//

import SwiftUI

struct SearchBarHeaderView: View {
    @State var searchFieldText = "Search"
    @State var text = ""
    @EnvironmentObject private var viewModel: WeatherViewModel
    
    var body: some View {
        HStack{
            TextField(searchFieldText, text: $text, prompt: Text(searchFieldText))
                .onSubmit {
                    guard !text.isEmpty else {
                        searchFieldText = "Enter a valid name"
                        return
                    }
                    searchCity()
                    
                    print("id", viewModel.id)
                }
                .preferredColorScheme(.light)
                .textFieldStyle(.roundedBorder)
            Button {
                searchCity()
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                
            }
            
            
        }
    }
    
    func searchCity(){
        viewModel.weatherManager.name = text
        viewModel.loadDataByCity()
    }
}
//
//struct SearchBarHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarHeaderView()
//    }
//}
