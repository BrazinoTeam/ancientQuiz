//
//  OnboardingScreen.swift


import SwiftUI
import Combine

struct OnboardingScreen: View {
    @ObservedObject var loadignViewModel: OnboardVM
    @State private var loadingProgress: CGFloat = 0
    
    var body: some View {
        VStack {
          
            OnboardingProgressBarView(currentProgress: loadingProgress, maxProgress: 280)
            Text("loading...")
                .font(Font.custom("Peralta-Regular", size: 28))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 100)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .backgroundImage(image: .bgLoad)
        .onChange(of: loadignViewModel.isAnimating) { animating in
            if animating {
                withAnimation(.linear(duration: 2)) {
                    loadingProgress = 280
                }
            }
        }
    }
}

#Preview {
    OnboardingScreen(loadignViewModel: OnboardVM())
}
