//
//  ContentView.swift
//  Resume_App
//
//  Created by hububble on 2023/9/12.
//

import SwiftUI
let me = Resume.shared

struct ContentView: View {
    var body: some View {
        VStack{
            HStack(spacing: 50){
                Image("avatar")
                    .resizable().aspectRatio(contentMode: .fit)
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
            
            Button("Contact Me"){}
                .font(.title3).bold()
                .foregroundColor(Color(uiColor:.white))
                .frame(maxWidth: .infinity)
                .padding(.vertical,10)
                .background(Color(uiColor: .systemBrown))
                .cornerRadius(50)
//                .onTapGesture {
//                    <#code#>
//                }
            
            Text("Skills")
                .font(.title2).bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack(spacing: 50){
                ForEach(me.skills ,id:\.self){skill in
                    
                    VStack{
                        Image(skill)
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                        Text(skill)
                    }
                }
            }
            
            Text("Experiece")
                .font(.title2).bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack{
               
                VStack(spacing: 10){
                    ForEach(me.experiences ,id:\.title){exp in
                        Text("\(exp.start) --- \(exp.end)")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text(exp.title)
                            .font(.title3).bold()
                        Text(exp.company)
                    }
                }
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
