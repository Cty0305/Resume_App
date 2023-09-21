//
//  ContentView.swift
//  Resume_App
//
//  Created by hububble on 2023/9/12.
//

import SwiftUI
let me = Resume.shared
struct ContentView: View {
    
    @State var isShowingContact = false
    
    var body: some View {
        ScrollView{
            VStack{
                HStack(spacing: 50){
                    Image("avatar")
                        .resizable().aspectRatio(contentMode: .fit)
                    //                    .clipShape(style: Circle)
                        .frame(width: 100)
                    VStack(spacing: 14){
                        Text(me.name)
                            .font(.title).bold()
                        Text(me.title)
                        Label(me.location, systemImage: "location.fill")
                            .foregroundColor(Color(.gray))
                    }
                }.padding()
                Text(me.bio)
                    .font(.title3)
                    .lineSpacing(4)
                
                Button{
                    isShowingContact = true
                    
                    
                }label: {
                    Text("Contact Me")
                    .font(.title3).bold()
                    .foregroundColor(Color(uiColor:.white))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,12)
                    .background(Color(uiColor: .systemBrown))
                    .cornerRadius(50)
                    .padding(.vertical, 10)
                }

                
                Text("Skills")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                HStack(spacing: 40){
                    ForEach(me.skills ,id:\.self){skill in
                        
                        VStack{
                            Image(skill)
                                .resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            Text(skill)
                        }
                    }
                }.padding(.vertical)
                
                Text("Experiece")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                VStack(spacing: 0){
                    ForEach(me.experiences.indices ,id:\.self){index in
                        HStack{
                            DotlineShape(dotSize: 10,
                                         lineWidth: 2,
                                         style: index == 0 ? .bottomHalf :
                                             .topHalf)
                            .frame(width: 70)
                            .foregroundColor(.secondary)
                            
                            let exp = me.experiences[index]
                            
                            VStack(spacing: 10){
                                Group{
                                    Text("\(exp.start) --- \(exp.end)")
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(exp.title)
                                        .font(.title3).bold()
                                    Text(exp.company)
                                        .font(.body)
                                        .padding(.bottom, 20)
                                }.frame(width: 250, alignment: .leading)
                                }
                        }
                        
                    }
                }
            }
            .padding()
            .onTapGesture { isShowingContact = false }
            .overlay(Color.black.opacity(isShowingContact ? 0.5:0))
            .overlay(alignment:.top){
                Group{
                    if (isShowingContact){
                        ContactView(isShowing:$isShowingContact)
                            .offset(y:UIScreen.main.bounds.maxY * 0.22)
                            .transition(.slide)
                    }
                }.animation(.spring(), value: isShowingContact)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
