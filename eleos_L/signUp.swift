//
//  signUp.swift
//  eleos_L
//
//  Created by TokaJaber on 21/08/2023.
//

//import SwiftUI
//
//struct signUp: View {
//    
//    
//    @State private var username = ""
//    @State private var password = ""
//    @State private var wrongUsername: Float = 0
//    @State private var wrongPassword: Float  = 0
//    
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color.purple
//                    .opacity(0.60)
//                    .ignoresSafeArea()
//                Circle()
//                    .scale(1.7)
//                    .foregroundColor(.white.opacity(0.15))
//                Circle()
//                    .scale(1.35)
//                    .foregroundColor(.white)
//                
//                VStack {
//                    Text("Sign up")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
//                    
//                    TextField("Username", text: $username)
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//                        .border(.red, width: CGFloat(wrongUsername))
//                    
//                    SecureField("Password", text: $password)
//                        .padding()
//                        .frame(width: 300, height: 50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//                        .border(.red, width: CGFloat(wrongPassword))
//                    
//                    
//                    
//                    Button("Sign up") {
//                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                    }
//                        .foregroundColor(.white)
//                        .frame(width: 300, height: 50)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                    
//                    Button("already have an account ?") {
//                        NavigationLink(destination:  ContentView()) {
//                            Text("")
//                        }
//                    }
//                    .padding()
//                    
//                    Button("Skip") {
//                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                    }
//                    .padding(5)
//
//                    
//                    
//                }
//                
//            }
//        }.navigationBarHidden(true)
//    }
//}
//
//
//
//struct signUp_Previews: PreviewProvider {
//    static var previews: some View {
//        signUp()
//    }
//}
