//
//  TabBar.swift
//  AffiCar
//
//  Created by Alex Fount on 29.08.22.
//

import SwiftUI

struct TabBar: View {
    @Binding var showAddNoteView: Bool
    
    var body: some View {

        ZStack {
            Image("tabbarBackGradient")
             //.renderingMode(.template)
                .resizable()
                .scaledToFill()
            // .foregroundColor(Color.yellow)
                .frame( height: 85)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
                .frame(maxHeight: .infinity, alignment: .bottom)
                //.background(Color.red)
            HStack{
                Button{} label: {
                    Image(systemName: "externaldrive.badge.person.crop")
                }.frame(width: 80, height: 80)
                    .padding(.leading, 40)
                
                Spacer()
                
                NavigationLink { NotesView()} label: {
                    Image(systemName: "list.star")
                        .frame(width: 80, height: 80)
                        .padding(.trailing, 37)
                }
                
//                NavigationLink( destination: NotesView()) {
//                    Button{} label: {
//                        Image(systemName: "list.star")
//                    }
//                    .frame(width: 80, height: 80)
//                    .padding(.trailing, 37)
//                }

            }
            .font(.system(size: 20))
            .foregroundColor(Color("background_midDark"))
            .padding(.bottom, 3)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
            
            Button {
                showAddNoteView.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 45).weight(.light) )
                    .frame(width: 62 , height: 62)
                    .contentShape(Rectangle( ))
                
            }   .foregroundColor(Color("background_Light"))
                .background(Color("buttonColor"))
                .cornerRadius(50)
                .frame(maxHeight: .infinity, alignment: .bottom )
                .padding(.bottom, 50)
            
        }
        .ignoresSafeArea()
        .edgesIgnoringSafeArea(.all)
        .frame(maxHeight: .infinity, alignment: .bottom)
        
        
        
        
        
        
    }
}

//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar(showAddNoteView: showAddNoteView)
//    }
//}
