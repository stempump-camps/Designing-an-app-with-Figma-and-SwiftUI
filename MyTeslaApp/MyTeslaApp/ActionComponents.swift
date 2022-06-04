//
//  ActionComponents.swift
//  MyTeslaApp
//
//  Created by Ritesh Kanchi on 6/3/22.
//

import SwiftUI

struct ActionComponents: View {
    var body: some View {
        //        ActionNotification(open: .constant(true), icon: "fanblades.fill", text: "Turning on the fan...")
        //        VoiceCommandView(open: .constant(true), text: "Go to times square")
        //        MediaPlayer()
        ChargingView()
    }
}

struct ActionComponents_Previews: PreviewProvider {
    static var previews: some View {
        ActionComponents()
    }
}

struct ActionNotification: View {
    
    @Binding var open: Bool
    var icon: String
    var text: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment:.center, spacing: 10) {
                Image(systemName: icon)
                Text(text)
                    .fontWeight(.medium)
                Spacer()
                Button(action: {
                    withAnimation {
                        open = false
                    }
                }) {
                    Text("Cancel")
                        .font(.subheadline)
                        .opacity(0.5)
                }
            }
            .padding(20)
            .foregroundColor(Color.white)
            .background(Color("DarkGray"))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct VoiceCommandView: View {
    
    @Binding var open: Bool
    var text: String
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image("Wave")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack(alignment: .bottom, spacing: 20) {
                HStack {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                    Text(text)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 15)
                Spacer()
                Button(action:{
                    withAnimation {
                        open = false
                    }
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("DarkGray"))
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color("Green"))
            .foregroundColor(Color("DarkGray"))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MediaPlayer: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                HStack(alignment:.center, spacing: 10) {
                    Color.blue
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Don’t take the Money")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Bleachers – Gone Now")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .opacity(0.5)
                    }
                    Spacer()
                }
                VStack(spacing: 5) {
                    HStack {
                        Text("1:05")
                        Spacer()
                        Text("-2:30")
                    }
                    .font(.system(size: 14, weight: .medium, design: .monospaced))
                    .opacity(0.5)
                    ZStack(alignment: .leading) {
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(maxWidth: 200)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 192)
                    }
                }
                CustomDivider()
                HStack {
                    HStack(alignment: .center, spacing: 20) {
                        Button(action:{}) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        Button(action:{}) {
                            Image(systemName: "playpause.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                        }
                        Button(action:{}) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 20) {
                        Button(action:{}) {
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        
                        RadialGradient(gradient: Gradient(colors: [Color.white, Color.white.opacity(0.1)]), center: .leading, startRadius: 31, endRadius: 32)
                            .frame(width: 44, height: 44)
                            .mask {
                                Image(systemName: "speaker.wave.3.fill")
                                    .font(.system(size: 20, weight: .semibold, design: .default))
                            }
                        
                        Button(action:{}) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                    }
                }
            }
            .padding(.bottom,20)
            .padding()
            .frame(maxWidth:.infinity)
            .background(Color("DarkGray"))
            .foregroundColor(Color.white)
            .cornerRadius(16, corners: [.topLeft, .topRight])
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ChargingView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment:.leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 5) {
                    Label("237 miles", systemImage: "bolt.fill")
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("Green"))
                    Text("3h 55m remain – 32/3A – 30 mi/hour")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
                VStack(alignment:.leading, spacing: 5) {
                    Text("Charge Limit: 315 miles")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .opacity(0.5)
                    ZStack(alignment: .leading) {
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(maxWidth: 200)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 192)
                    }
                }
                CustomDivider()
                Button(action: {}) {
                    Text("Stop Charging")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .padding(.vertical,8)
                        .padding(.horizontal,14)
                        .background(Color("Red"))
                        .clipShape(Capsule())
                }
                .frame(maxWidth:.infinity)
            }
            .padding(.bottom,20)
            .padding()
            .frame(maxWidth:.infinity)
            .background(Color("DarkGray"))
            .foregroundColor(Color.white)
            .cornerRadius(16, corners: [.topLeft, .topRight])
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
