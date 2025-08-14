//
//  WelcomeView.swift
//  otakuwise
//
//  Created by Austin Sofaer on 14/8/2025.
//

import SwiftUI

struct WelcomeView: View {
    @State private var animateTitle = false
    @State private var animateSubtitle = false
    @State private var animateButton = false
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack(spacing: 50) {
                Spacer()
                logoSection
                subtitleSection
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    WelcomeView()
}

// MARK: - Components
private extension WelcomeView {
    var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.blue.opacity(0.8),
                Color.cyan.opacity(0.6),
                Color.teal.opacity(0.4),
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    var logoSection: some View {
        VStack(spacing: 20) {
            
        }
    }
    
    var subtitleSection: some View {
        VStack(spacing: 20) {
            
        }
    }
}

// MARK: - Actions
/* TODO:
    - create action for going to dashboard
    - create action for starting animation for welcome screen
 */
 


