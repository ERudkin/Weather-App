//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Elliot Joseph on 07/02/2022.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    var body: some View {
        ZStack{
            ParticleView(id: $viewModel.id)
            VStack{
                VStack(alignment: .leading){
                    SearchBarHeaderView()
                        .environmentObject(viewModel)
                        .frame(width: screenWidth * 0.95, height: screenHeight * 0.03, alignment: .center)
                        .padding(.vertical, 20)
                    
                    VStack(alignment: .leading, spacing: 50){
                        Text(viewModel.name)
                            .font(.system(size: 48))
                        Text("\(viewModel.temperature) ° C")
                            .font(.system(size: 48))
                        
                    }
                    .padding()
                    .foregroundColor(.white)
                    
                }
                Spacer()
                
                Text(viewModel.Description)
                    .font(.system(size: 48))
                    .foregroundColor(.white)
    
                Spacer()
                }
            .padding(.vertical)
        }
        .background(Image("CloudySky"))
        .onAppear {
            viewModel.loadDataByLocation()
        }
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
