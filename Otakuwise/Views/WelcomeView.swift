//
//  WelcomeView.swift
//  otakuwise
//
//  Created by Austin Sofaer on 14/8/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var animateLogo = false
    @State private var animateSubtitle = false
    
    var body: some View {
        ZStack {
            AppColours.primary
                .ignoresSafeArea(.all)
            
            VStack(spacing: 50) {
                Spacer()
                mainSection
                Spacer()
                Spacer()
            }
        }
        .onAppear {
            startAnimationSequence()
        }
    }
}

// MARK: - Components
private extension WelcomeView {
    var mainSection: some View {
        VStack(spacing: 20) {
            Image("OtakuwiseSignatureFull")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280, height: 80)
                .foregroundStyle(AppColours.primaryAccent)
                .scaleEffect(animateLogo ? 1.0 : 0.5)
                .opacity(animateLogo ? 1.0 : 0.0)
                .animation(.easeOut(duration: 1.0), value: animateLogo)
            
            HStack() {
                Spacer()
                Spacer()
                Spacer()
                
                Text("Stories that\n stay with you.")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundStyle(AppColours.secondaryAccent)
                    .multilineTextAlignment(.trailing)
                    .fontDesign(.rounded)
                    .kerning(2.6)
                    .offset(x: animateSubtitle ? 0 : 100)
                    .opacity(animateSubtitle ? 1.0 : 0.0)
                    .animation(.spring(response: 0.8, dampingFraction: 0.7).delay(1.2), value: animateSubtitle)
                
                Spacer()
            }
            
        }
    }
}

// MARK: - Actions
/* TODO:
    - create action for going to dashboard
 */
private extension WelcomeView {
    func startAnimationSequence() {
        animateLogo = true
        animateSubtitle = true
    }
}

#Preview {
    WelcomeView()
}
