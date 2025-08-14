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
    @State private var animateExploreButton = false
    
    var body: some View {
        ZStack {
            AppColours.primary
                .ignoresSafeArea(.all)
            
            VStack(spacing: 50) {
                Spacer()
                mainSection
                Spacer()
                Spacer()
                exploreButton
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
                
                Text("Stories that\n stay with\n you.")
                    .font(.custom("", size: 50, relativeTo: .largeTitle))
                    .fontWeight(.medium)
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
    
    var exploreButton: some View {
        NavigationLink(destination: DashboardView()) {
            
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
               
                Text("Explore")
                    .kerning(0.5)
            }
            // don't use text primary to keep font always white
            .foregroundStyle(Color.white)
            .frame(width: 200, height: 50)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [AppColours.primaryAccent, AppColours.secondaryAccent]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(25)
            .shadow(color: AppColours.primaryAccent.opacity(0.3), radius: 8, x: 0, y: 4)
            .fontWeight(.heavy)
            .fontDesign(.rounded)
            .font(.body)
        }
        .scaleEffect(animateExploreButton ? 1.0 : 0.8)
        .opacity(animateExploreButton ? 1.0 : 0.0)
        .animation(.spring(response: 0.6, dampingFraction: 0.8).delay(2.0), value: animateExploreButton)
    }
}

// MARK: - Actions
private extension WelcomeView {
    func startAnimationSequence() {
        animateLogo = true
        animateSubtitle = true
        animateExploreButton = true
    }
}

#Preview {
    WelcomeView()
}
