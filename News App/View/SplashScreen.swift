import SwiftUI

struct SplashView: View {

    @State private var isActive = false

    var body: some View {

        if isActive {

            NewsView()

        } else {

            ZStack {

                VStack(spacing: 10){
                    Text("News App")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                }
            }

            .onAppear {

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

                    withAnimation {

                        isActive = true
                    }
                }
            }
        }
    }
}
   
