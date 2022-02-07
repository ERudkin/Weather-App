//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @State var searchFieldText = "Search"
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    TextField(searchFieldText, text: $text, prompt: Text(searchFieldText))
                        .onSubmit {
                            guard !text.isEmpty else {
                                searchFieldText = "Enter a valid name"
                                return
                            }
                            searchCity()
                        }
                        .preferredColorScheme(.light)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        print(text)
                        searchCity()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }
                .frame(width: screenWidth * 0.95, height: screenHeight * 0.03, alignment: .center)
                .padding(.vertical)
                
                VStack(alignment: .leading, spacing: 50){
                    Text(weatherViewModel.name)
                        .font(.system(size: 48))
                    Text("\(weatherViewModel.temperature) ° C")
                        .font(.system(size: 48))
                    
                }
                .padding()
                .foregroundColor(.white)
                
            }
            Spacer()
            
            Text(weatherViewModel.Description)
                .font(.system(size: 48))
                .foregroundColor(.white)
            
            
            
            Spacer()
            
            
            
        }
        .refreshable {
            weatherViewModel.loadDataByCity()
        }
        .background(BackgroundView())
        .onAppear {
            weatherViewModel.loadDataByLocation()
        }
    }
    
    
    func searchCity(){
        weatherViewModel.weatherManager.name = text
        weatherViewModel.loadDataByCity()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}




struct BackgroundView: View {
    var body: some View{
        EmptyView()
            .frame(width: screenWidth, height: screenHeight, alignment: .center)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
}

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
