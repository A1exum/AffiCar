//
//  Home.swift
//  AffiCar
//
//  Created by Alex Fount on 28.08.22.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Note>
    @FetchRequest(sortDescriptors: []) var owners: FetchedResults<Owner>
    
    var userDataAPI = UserDataAPI()
    
    @State private var showAddNoteView = false
    
    @AppStorage("wasStartedOnce") var wasStartedOnce: Bool?
    @AppStorage("userFirstName") var userFirstName: String?
    
    @State var titleImages: [UIImage] = [UIImage(named: "car") ?? UIImage()]
    @State var titleImage = UIImage(named: "car") ?? UIImage()
    @State var defaultImage = UIImage(named: "car_tmb") ?? UIImage() //
    //picker params
    @State var images: [UIImage] = [] //
    @State var picker = false //
    @State var image = UIImage()
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background
                Color.mainBackground
                    .ignoresSafeArea()
                Image("rightLinesPng")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width, height: 330, alignment: .topTrailing)
                    .padding(.trailing, 0)
                    .frame(maxHeight: .infinity, alignment: .topTrailing)
                    .padding(.top, 180)
                    .opacity(0.3)
                
                Image("leftLinesPng")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width, height: 330 , alignment: .bottomLeading )
                    .padding(.leading, 0)
                    .frame(maxHeight: .infinity, alignment: .bottomLeading )
                    .padding(.bottom, 180)
                    .opacity(0.5)
                
                // MARK: - content
                ScrollView {
                    VStack {
                        
                        if wasStartedOnce != true {
                            
                            ProgressView("Configuring first start")
                            .padding(.bottom, 5)
                                .onAppear{
                                    onStartConfigure()
                                    userDataAPI.setDefaultUserData()
                                    saveDataToDB()
                                }
                        }
                        
                        ZStack {
                            if owners.isEmpty {
                                Image(uiImage: defaultImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.width * 0.5, alignment: .center)
                                    .cornerRadius(15)
                                    .aspectRatio( contentMode: .fill)
                                   // .frame(maxHeight: 350, alignment: .bottom)
                                  //  .padding(.top, 10)
                                    .shadow(color: .gray, radius: 7, x: 1, y: 1)
                            }
                            
                            else {
                                Image(uiImage: UIImage(data: owners[0].titleImage ?? Data()) ?? defaultImage )
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.width * 0.5, alignment: .center)
                                    .cornerRadius(15)
                                    .aspectRatio( contentMode: .fill)
                                    //.frame(maxHeight: 350, alignment: .bottom)
                                    //.padding(.top, 10)
                                    .shadow(color: .gray, radius: 7, x: 1, y: 1)
                            }
                            
                            Button{
                                picker.toggle()
                            } label: {
                                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                            }
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .font(.system(size: 35))
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.94,  maxHeight: UIScreen.main.bounds.width * 0.5, alignment: .bottomTrailing)
                            .opacity(0.7)
                            .shadow(color: .gray, radius: 3, x: 1, y: 1 )
                            
                        }
                        HStack {
                            Text("Maseratti ML221is 1998")
                                .padding(.leading, 20 )
                        }
                        
                        ScrollViewReader { proxy in
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack{
                                    ForEach(1...10, id: \.self) { num in
                                        Image("car\(num)")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 110, height: 110)
                                            .background(.regularMaterial)
                                            .clipped()
                                            .id(num)
                                    }
                                }
                            }
                            .background(.white)
                            .frame(height: 110)
                            .cornerRadius(15)
                            .shadow(color: .gray, radius: 3, x: 1, y: 1)
                            .frame(maxWidth: .infinity )
                            .padding(.leading, 18)
                            .padding(.trailing, 18)
                            .onAppear {
                                proxy.scrollTo(3)
                            }
                        }
                        HStack {
                            ForEach(1..<5) { _ in
                                Image(systemName: "plus")
                                    .frame(width: 65, height: 65)
                                    .font(.system(size: 35).weight(.light))
                                    .foregroundColor(.gray)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(lineWidth: 2)
                                            .foregroundColor(.white)
                                    )
                                    .frame(maxHeight: 80)
                                    .padding(5)
                                    .padding(.top, 5)
                                
                            }
                        }
                        
                        List {
                            ForEach (notes) { note in
                                HStack {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(note.title ?? "Unknown Title")
                                            Text(note.subtitle ?? "Unknown Author" )
                                                .foregroundColor(.secondary)
                                        }
                                        Spacer()
                                        Text(note.price ?? "")
                                            .padding(.trailing, 40)
                                    }
                                }
                            }
                        }
                        .listStyle(.plain)
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
                        .cornerRadius(15)
    //                    .frame(width: 400, height: 30, alignment: .trailing)
    //                    .padding(.trailing, 30 )
                        NavigationLink { NotesView()} label: {
                            Text("notes")
                        }
                    }
                }
                
//                .safeAreaInset(edge: .bottom, spacing: 55) {
//                    Text("Inssss")
//                }
                //.padding(.bottom, 85)
                // MARK: - tabbar
                TabBar(showAddNoteView: $showAddNoteView)

                .navigationBarHidden(true)
                .navigationTitle("")
                //.edgesIgnoringSafeArea([.top, .bottom])
                .navigationBarBackButtonHidden(true)
                .sheet(isPresented: $picker) {
                    ImagePicker(images: $titleImages, picker: $picker, image: $image)
                        .onDisappear {
                            saveTitleImgToDB()
                        }
                }
                .sheet(isPresented: $showAddNoteView) {
                    AddNoteView()
                }
            }
        }
        
    }
    func saveDataToDB()  {
        if !owners.isEmpty {
            let  owner = owners[0]
            print("second start")
            owner.titleImage = try? titleImage.jpegData(compressionQuality: 0.8)
            try? moc.save()
        }
        else {
            var owner = Owner(context: moc)
            owner.ownerName = "Первый пуск"
            owner.titleImage = titleImage.jpegData(compressionQuality: 0.8)
            try? moc.save()
            print("заполнил пустой массив")
        }
        
    }
    
    func saveTitleImgToDB()  {
        if !owners.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                owners[0].titleImage = try? titleImages.last!.jpegData(compressionQuality: 0.5)
                try? moc.save()

            }
            
        }
        else {
            var owner = Owner(context: moc)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                owner.titleImage = try?  titleImages.last!.jpegData(compressionQuality: 0.5)}
            try? moc.save()
            
        }
        
        
        
        //        var  owner = owners[0]
        //        let owner = Owner(context: moc)
        //        owner.ownerName = "имя"
        //        owner.titleImage = titleImage.jpegData(compressionQuality: 0.8)
        //        try? moc.save()
        //        print("заполнил пустой массив")
        
        
        //try?  moc.save()
    }
    
    func deleteOwner() {
        let owner = owners[0]
        moc.delete(owner)
        
        try?  moc.save()
    }
    
    func onStartConfigure() {
        if wasStartedOnce != true  {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation (Animation.linear(duration: 0)){
                    
                    wasStartedOnce = true
                    
                }
            }
        }
        
    }
    
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
