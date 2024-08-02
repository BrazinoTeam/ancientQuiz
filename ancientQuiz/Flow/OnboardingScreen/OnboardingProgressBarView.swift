//
//  OnboardingProgressBarView.swift

import SwiftUI

struct OnboardingProgressBarView: View {
    @State private var barLength: CGFloat = 0
    
    var currentProgress: CGFloat
    var maxProgress: CGFloat
    
    var innerProgressBarLength: CGFloat {
        let ratio = currentProgress / maxProgress
        return max(0, min(barLength * ratio, barLength - 2))
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 5)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(hex: "#FF0000"),
                            Color(hex: "#D10000")
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .background {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(.clear)
                }
            
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(hex: "#FF0000"),
                            Color(hex: "#D10000")
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(maxWidth: innerProgressBarLength)
                .frame(height: 16)
                .padding(4)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: 320)
        .readSize { self.barLength = $0.width }
        .shadow(color: .cYellowBack, radius: 11, x: 0, y: 2)
    }
}

#Preview {
    OnboardingProgressBarView(currentProgress: 100, maxProgress: 280)
}
