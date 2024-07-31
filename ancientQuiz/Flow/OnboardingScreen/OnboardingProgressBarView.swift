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
                .stroke(Color.cRedTwo, lineWidth: 5)
                .background {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(.clear)
                }
            
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(hex: "#D10000"),
                            Color(hex: "#FF0000")
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(color: .cYellowBack, radius: 11, x: 0, y: 2)
                .frame(maxWidth: innerProgressBarLength)
                .frame(height: 16)
                .padding(4)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: 320)
        .clipShape( RoundedRectangle(cornerRadius: 20))
        .readSize { self.barLength = $0.width }
    }
}

#Preview {
    OnboardingProgressBarView(currentProgress: 50, maxProgress: 280)
}
