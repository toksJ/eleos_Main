//
//  Home.swift
//  eleos_L
//
//  Created by TokaJaber on 22/08/2023.
//

import SwiftUI

struct Home: View {
    
    @State var buttonSheet = false
    @State var AccountSheet = false

    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                HStack {
                    Text("eleos")
                        .italic()
                        .bold()
                        .font(.system(size: 30))
                        
                    Spacer()
                    
                    Button {
                        AccountSheet.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .sheet(isPresented: $AccountSheet) {
                                AccountSheetView()
                                    .presentationDetents([.height(730)])
                            }
                        
                    }
                    
                    Button {
                        buttonSheet.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .sheet(isPresented: $buttonSheet) {
                                BottomSheetView()
                                    .presentationDetents([.height(730)])
                            }
                        
                    }
                    .padding(.trailing, 10)
                    
   
                }
                
                Text("Get Things Done")
                    .italic()
                    .padding(-10)
                Spacer()

            }
            .padding(.leading, 20)
            
            
            
        }
        .navigationBarHidden(true)
    }
    
    struct BottomSheetView: View {
        @State private var wakeUp = Date.now
        @State private var isToggled = false

        
        var body: some View {
            NavigationView {
                ZStack {
                    VStack {
                        Text("Settings")
                            .bold()
                            .padding(15)
                            .accentColor(.black)
                            .dynamicTypeSize(.xLarge)
                        
                        Form {
                            
                            
                            Section("General") {
                                
//                                NavigationLink(destination: NotificationView(), label: {
//                                    Text("Notification")
//
//
//                                })
                                Toggle("Notification", isOn: $isToggled)

                                
                                NavigationLink(destination: ApperanceView(), label: {
                                    Text("Apperance")
                                    Image(systemName: "paintbrush.fill").offset(x: 175)
                                })
                            }
                            
                            Section("Help Center") {
                                
                                NavigationLink(destination: PrivacyView(), label: {
                                    Text("Privacy policy")
                                })
                                
                                NavigationLink(destination: SupportView(), label: {
                                    Text("Support")
                                })
                            }
                            
                            Section("About The App"){
                                
                                NavigationLink(destination: AboutEleosView(), label: {
                                    Text("About Eleos")
                                    Image(systemName: "apps.iphone").offset(x: 175)

                                })
                                
//                                NavigationLink(destination: QuestionsView(), label: {
//                                    Text("Questions")
//                                    Image(systemName: "questionmark.folder.fill").offset(x: 175)
//
//                                })
//                                NavigationLink(destination: ToDoListView(), label: {
//                                    Text("To-Do List")
//                                    Image(systemName: "list.bullet.clipboard.fill").offset(x: 175)
//
//                                })
//                                NavigationLink(destination: DropsView(), label: {
//                                    Text("Drops")
//                                    Image(systemName: "pipe.and.drop.fill").offset(x: 205)
//                                })
//                                NavigationLink(destination: PlantsView(), label: {
//                                    Text("Plants")
//                                    Image(systemName: "arrow.up.bin.fill").offset(x: 205)
//                                })
                            }
                            
                            Section("More"){
                                NavigationLink(destination: CreatorsView(), label: {
                                    Text("About us")
                                    Image(systemName: "person.2.fill").offset(x: 175)


                                })
                            }
                            
                            Section("Logout"){
                                NavigationLink(destination: ContentView(), label: {
                                    HStack {
                                        Image(systemName: "person.2.fill")
                                        Text("Sign Out")
                                    }
                                    
                                    


                                })
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                    }
                }
                
            }
        }
        
    }
    struct NotificationView: View {
        @State private var isToggled1 = false
        @State private var isToggled2 = false
        @State private var isToggled3 = false


        
        var body: some View {
            Form {
                
                Toggle("Mute until unmuted", isOn: $isToggled1)
                
                if isToggled1 {
                    Text("Muted")
                        .font(.system(size: 12, weight: .light, design: .default))
                }
                Toggle("Mute for a day", isOn: $isToggled2)
                
                if isToggled2 {
                    Text("Muted for a day")
                        .font(.system(size: 12, weight: .light, design: .default))
                }
                Toggle("Mute for an hour", isOn: $isToggled3)
                
                if isToggled3 {
                    Text("Muted for an hour")
                        .font(.system(size: 12, weight: .light, design: .default))
                }
            }
            
        }
                
    }
    
    
    
    
    
    struct AccountSheetView: View {
        var body: some View {
            Text("Account")
                .bold()
                .padding(15)
                .accentColor(.black)
                .dynamicTypeSize(.xLarge)
            Form {
                
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                //                    .scale(1.0)
                //                    .size(width: 40, height: 40)
                Text("okay")
                //
                
            }
            
        }
    }
    struct ApperanceView: View {
        @State private var FontSize = 0
        @State private var iconSize = 0.0
        @State private var bgColor =
                Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

        var body: some View {
            Form {
                
                Stepper(value: $FontSize, in: 0...10) {
                    Text("Font size: \(FontSize)")
                }
                Text("the current icon size is ^[\(Int(iconSize)) icons avilable](inflect: true)")
                Slider(value: $iconSize, in: 0...10)
                
                VStack {
                            ColorPicker("Alignment Guides", selection: $bgColor)
                        }
                    }
                
            }
            
        }
        
    }
    
    struct PrivacyView: View {
        
        var body: some View {
            Form{
                Text("All user information is private.")
            }
        }
    }
    
    struct SupportView: View {
        var body: some View {
            Form {
                Section("Support") {
                    NavigationLink(destination: SupportView(), label: {
                        Text("Contact us!")
                        Image(systemName: "envelope").offset(x: 175)
                    }
                    )
                }
            }
        }
        
        //        let email = "eleosmanaging@gmail.com"
        //
        //        if let url = URL(string: "mailto:\(email)") {
        //            if #available(iOS 10.0, *) {
        //                UIApplication.shared.open(url)
        //            } else {
        //                UIApplication.shared.openURL(url)
        //
        //            }
        //        }
        //            }
        //email attempt
    }
    
    
    
    
//    struct QuestionsView: View {
//        var body: some View {
//            Form {
//                Section("Questions") {
//
//                    Text("The questions only show up when ur a new member of the app! We evaluated ur self tolerance level based on ur answers to the questions that you wer asked.")
//
//
//                }
//                .multilineTextAlignment(.leading)
//
//            }
//
//        }
//    }
//
    struct AboutEleosView: View {
        var body: some View {
            Form {
                Section("Eleos") {
                    
                    Text("all about eleos")
                    
                    
                }
                .multilineTextAlignment(.leading)
                
            }
            
        }
    }
    
    
//
//    struct ToDoListView: View {
//        var body: some View {
//            Form {
//                Section("To-Do List") {
//
//                    Text("The to do lists purpose is to help u organize ur schedule and chores a bit better by allowing u to add descriptions, priorities ur to dos, and add dead lines.")
//
//                }
//                .multilineTextAlignment(.leading)
//
//            }
//
//        }
//    }
//    struct DropsView: View {
//        var body: some View {
//            Form {
//                Section("Drops") {
//
//                    Text("Drops are a form of reward points u receive each time u cross of a certain amount of ur to dos. Drops will help u unlock certain plants and allow u to make these plants grow.")
//
//                }
//                .multilineTextAlignment(.leading)
//
//            }
//
//        }
//    }
//    struct PlantsView: View {
//        var body: some View {
//            Form {
//                Section("Plants") {
//
//                    Text("The plants can be unlocked and grown by the drops u earn when completing tasks. They aim to improve ur responsibility level by keeping them alive! ")
//
//                }
//                .multilineTextAlignment(.leading)
//            }
//
//        }
//    }
    struct CreatorsView: View {
        var body: some View {
            Form {
                Section("About us") {
                    
                    Text("Hi! We are the creators of this app.     Our sole purpose is to help our app users develop personal skills,                        such as: self tolerance, discipline, self developement, responsibility, etc.        We put all our hard work on this application and we tried our best to  make it as perfect as possible.              We hope you like it!!                 Remember: Personal development is a journey, not a destination! :) ")
                    
                }
                .multilineTextAlignment(.leading)
            }
            
        }
    }
    
    
    
    
    
    
    
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }

